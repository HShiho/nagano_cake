class Public::OrdersController < ApplicationController
  layout 'public'
  before_action :set_customer

  def new
    session.delete(:order)
    @order = Order.new
    # @address = Address.where(customer_id:["#{@current_customer.id}"])
  end

  def confirm
    @order = Order.new(order_params)
      if params[:order][:address_number] == "1"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = ApplicationHelper.full_name(current_customer.last_name , current_customer.first_name)
      elsif params[:order][:address_number] == "2"
        @address = Address.find(params[:order][:register])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:order][:address_number] == "3"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      else
　      redirect_to new_public_order_path
      end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @postage = 800
    # render :new if @order.invalid?
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_items = @order.order_items.new
        @order_items.item_id = cart_item.item_id
        @order_items.order_id = @order.id
        @order_items.price = cart_item.item.taxin_price
        @order_items.amount = cart_item.amount
        @order_items.save
      end
    @cart_items.destroy_all
    redirect_to public_complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all.order("created_at DESC")
  end

  def show
    @order = Order.find(params[:id])
  end



private
  def set_customer
    @current_customer = current_customer
  end


  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :billing_amount, :postage, :payment_method, :order_status)
  end

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end

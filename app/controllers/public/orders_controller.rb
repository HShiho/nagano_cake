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
    session[:order] = @order

      if params[:order][:address_number] == "1"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = "#{current_customer.last_name + current_customer.first_name}"
      elsif params[:order][:address_number] == "2"
        @order.postal_code = Address.find(params[:order][:register]).postal_code
        @order.address = Address.find(params[:order][:register]).address
        @order.name = Address.find(params[:order][:register]).name
      else params[:order][:address_number] == "3"
        @order = Order.new(address_params)
      # else
        # redirect_to new_public_order_path
      end

    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    # render :new if @order.invalid?
  end

  def create
    @order = Order.new(order_params)
    !@order.save
    redirect_to pubkic_complete_path
  end

  def complete
  end

  def index
  end

  def show
  end



private
  def set_customer
    @current_customer = current_customer
  end


  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :billing_amount, :postage, :payment_method, :order_status)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end

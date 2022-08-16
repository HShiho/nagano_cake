class Public::OrdersController < ApplicationController
  layout 'public'
  before_action :set_customer

  def new
    session.delete(:order)
    @order = Order.new
    # @address = Address.where(customer_id:["#{@current_customer.id}"])
  end

  def confirm
    @order = Order.new
    session[:order] = @order
      if params[:order][:address_number] == "1"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = ApplicationHelper.full_name(current_customer.last_name , current_customer.first_name)
      elsif params[:order][:address_number] == "2"
        @order.postal_code = Address.find(params[:order][:register]).postal_code
        @order.address = Address.find(params[:order][:register]).address
        @order.name = Address.find(params[:order][:register]).name
      elsif params[:order][:address_number] == "3"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      else

      end

    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @postage = 800
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
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end

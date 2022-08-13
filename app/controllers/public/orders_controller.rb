class Public::OrdersController < ApplicationController
  layout 'public'

  def new
    @current_customer = current_customer
    @order = Order.new
    if request.post?
      if params["my_address"]
      elsif params["select_address"]
      else params["new_address"]
      end
    end
  end

  def confirm
    @current_customer = current_customer
    @order = Order.new(order_params)
    render :new if @order.invalid?

  end

  def create
    @order = Order.new(order_params)
    !@order.save
    redirect_to pubkic_complete_path
  end

  def complete
    @current_customer = current_customer
  end

  def index
    @current_customer = current_customer
  end

  def show
    @current_customer = current_customer
  end


  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :billing_amount, :postage, :payment_method, :order_status)
  end

end

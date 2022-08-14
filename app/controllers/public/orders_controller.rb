class Public::OrdersController < ApplicationController
  layout 'public'

  def new
    @current_customer = current_customer
    @order = Order.new
    @address = Address.where(customer_id:["#{@current_customer.id}"])
    if request.post?
      if params["my_address"]
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = "#{current_customer.last_name + current_customer.first_name}"
      elsif params["select_address"]
        @order.postal_code = Address.find(params[:order][:select_address]).postal_code
        @order.address = Address.find(params[:order][:select_address]).address
        @order.name = Address.find(params[:order][:select_address]).name
      else params["new_address"]
        @order = @order.new(params[:new_address])
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

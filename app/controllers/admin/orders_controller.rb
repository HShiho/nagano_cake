class Admin::OrdersController < ApplicationController
  layout 'admin'

  def index
    @order = Order.find(params[:id])
    @orders = Order.where(customer_id: "#{params[:id]}")
  end

  def show
    @order = Order.find(params[:id])
  end

  def order
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end



   private

  def order_params
    params.require(:order).permit(:order_status)
  end


end

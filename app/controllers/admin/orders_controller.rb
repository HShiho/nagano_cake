class Admin::OrdersController < ApplicationController
  layout 'admin'

  def index
    @order = Order.find(params[:id])
    @orders = Order.where(customer_id: "#{params[:id]}").page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def order
    @order = Order.find(params[:id])
    if @order.update(order_params)
      @order.order_items.update(manufacture_status: "waiting_for_production") if @order.order_status == "payment_confirmation"
    end
    redirect_to admin_order_path
    # @order = Order.find(params[:id])
    # @order.update(order_params)
    # redirect_to admin_order_path(@order.id)
  end



   private

  def order_params
    params.require(:order).permit(:order_status)
  end


end

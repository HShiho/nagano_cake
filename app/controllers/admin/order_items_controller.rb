class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order_id = @order_item.order_id
    @order = Order.find("#{@order_id}")
    @order_item.update(order_item_params)
    if @order_item.manufacture_status == "m_production"
      @order.update(order_status: "production")
    elsif @order_item.manufacture_status == "complete" and ( @order.order_items.where(manufacture_status: "complete").count == @order.order_items.count )
      @order.update(order_status: "shopping_preparation")
    end
    redirect_to admin_order_path(@order_id)
    # @order_item = OrderItem.find(params[:id])
    # @order_item.update(order_item_params)
    # @order = @order_item.order_id
    # redirect_to admin_order_path(@order)
  end



   private

  def order_item_params
    # params.permit(:manufacture_status)
    params.require(:order_item).permit(:manufacture_status)
  end

end

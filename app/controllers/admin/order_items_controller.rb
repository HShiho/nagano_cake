class Admin::OrderItemsController < ApplicationController

  def update
    @order = Order.find(params[:id])
    @order_item = @order.order_items.find_by(item_id: params[:item_id])
    @order_item.update(order_item_params)
    redirect_to admin_order_path(@order.id)

  end



   private

  def order_item_params
    params.permit(:manufacture_status)
    # params.require(:order_item).permit(:manufacture_status)
  end

end

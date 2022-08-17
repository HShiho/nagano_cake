class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    @order = @order_item.order_id
    redirect_to admin_order_path(@order)

  end



   private

  def order_item_params
    params.permit(:manufacture_status)
    # params.require(:order_item).permit(:manufacture_status)
  end

end

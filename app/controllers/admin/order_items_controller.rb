class Admin::OrderItemsController < ApplicationController
  
  def update
    @order = Order.find(params[:id])
    @order_item = Order_item.find(@order.order_item.id)
    @order_item.update(order_item_params)
    redirect_to admin_order_path(@order.id)
    
  end
  
  
  
   private

  def order_item_params
    params.require(:order_item).permit(:manufacture_status)
  end
  
end

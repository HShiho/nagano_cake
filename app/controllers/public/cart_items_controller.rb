class Public::CartItemsController < ApplicationController
  layout 'public'
  before_action :set_customer
  
  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum,item| sum + item.sum_of_price }
  end
  
  def update
    @cart_item.find(params[:id])
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to public_items_path
  end
  
  def destroy
    @cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def reset
    @current_user.cart_items.destroy_all
  end
  
  def create
    if @cart_item.blank?
      @cart_item = current_customer.cart_item.build(item_id: params[:item_id])
    end
    @cart_item.amount += params[:amount].to_i
    @cart_item.save
    redirect_to public_cart_items_path
  end
  
  
  
private

  def set_customer
    @current_customer = current_customer
  end

  def address_params
    params.require(:curt_item).permit(:item_id, :customer_id, :amount)
  end

end
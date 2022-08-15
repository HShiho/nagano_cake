class Public::CartItemsController < ApplicationController
  layout 'public'
  before_action :set_customer

  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_items_params)
    if current_customer.cart_items.find_by(item_id: params[:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
      cart_item.amount += params[:amount].to_i
      cart_item.save
      redirect_to public_cart_items_path
    elsif @cart_item.save
        @cart_items = current_customer.cart_items.all
        render 'index'
    else
    redirect_to public_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  # カート内全ての商品を削除
  def reset
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  # カート内ひとつの商品を削除
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end


  private

  def cart_items_params
    params.permit(:customer_id, :item_id, :amount)
  end

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end

end

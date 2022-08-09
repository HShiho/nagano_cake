class Public::CartItemsController < ApplicationController
  layout 'public'
  before_action :current_cart
  before_action :set_cart

  def index
    @current_customer = current_customer
    @cart_items = current_customer.cart_items.all
  end

  def create
    @current_customer = current_customer
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to public_cart_items_path
    elsif @cart_item.save
        @cart_items = current_customer.cart_items.all
        redirect_to public_cart_items_path
    else
     redirect_to public_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end

end

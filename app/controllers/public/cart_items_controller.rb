class Public::CartItemsController < ApplicationController
  layout 'public'
  before_action :authenticate_customer!
  before_action :set_customer

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum,item| sum + item.sum_of_price }
  end

  def create
    @cart_items = CartItem.where(customer_id: @current_customer.id) if @cart_item.present?
    if @cart_item = @current_customer.cart_items.find_by(item_id: params[:item_id])
      @cart_item.amount += params[:amount].to_i
      @cart_item.save
      redirect_to public_cart_items_path
    else @cart_item = CartItem.new(cart_items_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to public_cart_items_path
    end
  end

  def update
    @cart_item = @current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item =  @current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def reset
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end



private

  def set_customer
    @current_customer = current_customer
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

  def cart_items_params
    params.permit(:item_id, :amount, :customer_id)
  end

end
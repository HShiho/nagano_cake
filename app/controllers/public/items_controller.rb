class Public::ItemsController < ApplicationController
  layout 'public'
  before_action :set_customer

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @item = @genre.items.order("created_at DESC").all
    elsif params[:search]
      @item = Item.where("name LIKE ?",'%' + params[:search] + '%')
    else
      @item = Item.order("created_at DESC").all
    end
    @items = @item.where.not(is_active: false).page(params[:page]).per(8)
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end


  private

  def set_customer
    @current_customer = current_customer
  end

end

class Public::ItemsController < ApplicationController
  layout 'public'

  def index
    @current_customer = current_customer
    @genres = Genre.all

    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @item = @genre.items.order("created_at DESC").all
      @items = @item.where.not(is_active: false)
    else
      @item = Item.order("created_at DESC").all
      @items = @item.where.not(is_active: false)
    end

  end

  def show
    @current_customer = current_customer
    @genres = Genre.all
    @item = Item.find(params[:id])
  end

end

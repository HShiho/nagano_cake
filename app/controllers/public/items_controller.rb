class Public::ItemsController < ApplicationController
  layout 'public'

  def index
    @current_customer = current_customer
    @genres = Genre.all

    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.order("created_at DESC").all
    else
      @items = Item.order("created_at DESC").all
    end

  end

  def show
    @current_customer = current_customer
  end

end

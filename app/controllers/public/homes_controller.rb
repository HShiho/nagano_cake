class Public::HomesController < ApplicationController
  layout 'public'

  def top
    @current_customer = current_customer
    @genres = Genre.all
    @items = Item.limit(4).order("created_at DESC")
  end

  def about
  end

end

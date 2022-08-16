class Public::HomesController < ApplicationController
  layout 'public'
  before_action :set_customer

  def top
    @genres = Genre.all
    @items = Item.limit(4).order("created_at DESC")
  end

  def about
  end


  private

  def set_customer
    @current_customer = current_customer
  end

end

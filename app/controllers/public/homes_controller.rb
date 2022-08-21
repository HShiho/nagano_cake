class Public::HomesController < ApplicationController
  layout 'public'
  before_action :set_customer

  def top
    @genres = Genre.all
    @item = Item.limit(4).order("created_at DESC")
    @items = @item.where.not(is_active: false)
  end

  def about
  end


  private

  def set_customer
    @current_customer = current_customer
  end

end

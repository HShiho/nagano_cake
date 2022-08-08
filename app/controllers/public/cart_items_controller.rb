class Public::CartItemsController < ApplicationController
  layout 'public'

  def index
    @current_customer = current_customer
  end
end

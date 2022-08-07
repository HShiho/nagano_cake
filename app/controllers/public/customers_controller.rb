class Public::CustomersController < ApplicationController
  layout 'public'

  def show
    @current_customer = current_customer
  end

  def edit
  end
end

class Public::AddressesController < ApplicationController
  def index
    @current_customer = current_customer
  end

  def edit
    @current_customer = current_customer
  end
end

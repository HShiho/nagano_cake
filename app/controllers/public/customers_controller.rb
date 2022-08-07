class Public::CustomersController < ApplicationController
  layout 'public'

  def show
    @current_customer = current_customer
    @customer = Customer.find(params[:id])
  end

  def edit
    @current_customer = current_customer
  end
end

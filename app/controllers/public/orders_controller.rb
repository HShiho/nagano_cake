class Public::OrdersController < ApplicationController
  def new
    @current_customer = current_customer
  end

  def index
    @current_customer = current_customer
  end

  def show
    @current_customer = current_customer
  end
end

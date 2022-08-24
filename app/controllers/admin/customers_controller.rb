class Admin::CustomersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    @error = @customer
  end

  def update
    @customer = Customer.find(params[:id])
    @error = @customer
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
    else
      @customer = Customer.find(@customer.id)
      render :edit
    end
  end


   private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end

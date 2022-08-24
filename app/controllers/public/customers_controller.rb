class Public::CustomersController < ApplicationController
  layout 'public'
  before_action :authenticate_customer!
  before_action :set_customer

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
     @customer.update(customer_params)
     redirect_to public_customer_path(@customer.id)
  end

  def withdrawal
  end

  def breakaway
    @current_customer.update(is_deleted: true)
    reset_session
    redirect_to public_root_path

  end



  private

  def set_customer
    @current_customer = current_customer
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end

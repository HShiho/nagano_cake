class Public::CustomersController < ApplicationController
  layout 'public'

  def show
    @current_customer = current_customer
    @customer = Customer.find(params[:id])
  end

  def edit
    @current_customer = current_customer
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
     @customer.update(customer_params)
     redirect_to public_customer_path(@customer.id)
  end

  def withdrawal
    @current_customer = current_customer
  end



   private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end

class Public::AddressesController < ApplicationController
  layout 'public'

  def index
    @current_customer = current_customer
    @address = Address.new
    @addresses = Address.where(customer_id: "#{current_customer.id}")
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to public_addresses_path
  end

  def edit
    @current_customer = current_customer
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to public_addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end


   private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end

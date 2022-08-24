class Public::AddressesController < ApplicationController
  layout 'public'
  before_action :authenticate_customer!
  before_action :set_customer

  def index
    @address = Address.new
    @addresses = Address.where(customer_id:[current_customer.id])
    @error = @address
  end

  def edit
    @address = Address.find(params[:id])
    @error = @address
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @error = @address
    if @address.save
      redirect_to public_addresses_path
    else
      @address = Address.new
      @addresses = Address.where(customer_id:[current_customer.id])
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    @error = @address
    if @address.update(address_params)
      redirect_to public_addresses_path
    else
      @address = Address.find(@address.id)
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end



  private

  def set_customer
    @current_customer = current_customer
  end

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end

end
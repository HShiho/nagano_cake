class Admin::ItemsController < ApplicationController
  layout 'admin'
  
  def new
    @item = Item.new
    @items = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end
  
  
   private

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:is_active,:image)
  end
  
end

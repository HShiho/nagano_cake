class Admin::ItemsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def new
    @item = Item.new
    @genres = Genre.all
    @error = @item
  end

  def create
    @item = Item.new(item_params)
    @error = @item
    if @item.save
     redirect_to admin_item_path(@item.id)
    else
     @item = Item.new
     @genres = Genre.all
     render :new
    end
  end

  def index
    if params[:search] == nil
      @items = Item.all.page(params[:page])
    elsif params[:search] ==  ''
      @items = Item.all.page(params[:page])
    else
      @items = Item.where("name LIKE ?",'%' + params[:search] + '%').page(params[:page])
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end


   private

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:is_active,:image,:genre_id)
  end

end

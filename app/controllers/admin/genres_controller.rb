class Admin::GenresController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
    @error = @genre
  end

  def create
    @genre = Genre.new(genre_params)
    @error = @genre
    if @genre.save
      redirect_to admin_genres_path
    else
      @genre = Genre.new
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end

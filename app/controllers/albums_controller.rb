class AlbumsController < ApplicationController
  before_action :authenticate_user!

  def index
    @albums = Album.where(user_id: current_user.id)
  end

  def new
    @album = Album.new
  end

  def create
     @album = Album.new(album_params)
     @album.user_id = current_user.id
    if @album.save
      redirect_to "/albums/#{@album.id}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to "/albums/#{@album.id}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album= Album.find(params[:id])
    @album.destroy
    redirect_to root_path, status: :see_other
  end

   private

   def album_params
     params.require(:album).permit(:name, :description, :images, :caption)
   end
end

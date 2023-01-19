class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_album, only: [:show, :edit, :update, :destroy]

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

  def show; end

  def edit;end

  def update
    if @album.update(album_params)
      redirect_to "/albums/#{@album.id}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album.destroy
    redirect_to root_path, status: :see_other
  end

   private
   def find_album
     @album = Album.find(params[:id])
   end

   def album_params
     params.require(:album).permit(:name, :description, :images, :caption)
   end
end

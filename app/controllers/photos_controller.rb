class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @album = Album.find(params[:album_id])
  end

  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.create(photo_params)
    redirect_to  "/albums/#{@album.id}"
  end

  def edit
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
  end

  def update
    @album = Album.find(params[:album_id])
    @photo= Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to "/albums/#{@album.id}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album= Album.find(params[:album_id])
    @photo= Photo.find(params[:id])
    @photo.destroy
    redirect_to "/albums/#{@album.id}", status: :see_other
  end

  private
    def photo_params
      params.require(:photo).permit(:image, :caption)
    end
end

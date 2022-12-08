class PhotosController < ApplicationController
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

  private
  def photo_params
      params.require(:photo).permit(:image, :caption)
  end
end

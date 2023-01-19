class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :find_album_object, only: [:new, :show, :create, :edit, :update, :destroy]
  before_action :find_photo_object, only: [ :show, :edit, :update, :destroy]


  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new

  end

  def show; end

  def create
    @photo = @album.photos.create(photo_params)
    redirect_to  "/albums/#{@album.id}"
  end

  def edit; end

  def update
    if @photo.update(photo_params)
      redirect_to "/albums/#{@album.id}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @photo.destroy
    redirect_to "/albums/#{@album.id}", status: :see_other
  end

  private
  def find_album_object
    @album = Album.find(params[:album_id])
  end

  def find_photo_object
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end
end

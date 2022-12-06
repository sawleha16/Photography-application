class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
     @album = Album.new(album_params)
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

   private

   def album_params
     params.require(:album).permit(:name, :description)
   end
end

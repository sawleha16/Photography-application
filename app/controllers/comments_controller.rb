class CommentsController < ApplicationController

   def create
     @album = Album.find(params[:album_id])
     @photo= Photo.find(params[:photo_id])
     @comment = @photo.comments.create(comment_params)
     redirect_to "/albums/#{@album.id}/photos/#{@photo.id}"
   end

   def edit
      @album = Album.find(params[:album_id])
      @photo = Photo.find(params[:photo_id])
      @comment = Comment.find(params[:id])
   end

   def update
      @album = Album.find(params[:album_id])
      @photo = Photo.find(params[:photo_id])
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to  "/albums/#{@album.id}/photos/#{@photo.id}" 
      else
        render :edit, status: :unprocessable_entity
      end
   end

   def destroy
     @album = Album.find(params[:album_id])
     @photo= Photo.find(params[:photo_id])
     @comment = Comment.find(params[:id])
     @comment.destroy
     redirect_to "/albums/#{@album.id}/photos/#{@photo.id}", status: :see_other
   end

   private
     def comment_params
       params.require(:comment).permit(:commenter, :body)
     end

end

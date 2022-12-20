class AddPhotoIdComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :photo_id, :integer
  end
end

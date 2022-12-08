class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.text :caption
      t.references :album, index: true
      # t.bigint :album_id
      t.timestamps
    end
    # add_index :photos, :album_id
  end
end

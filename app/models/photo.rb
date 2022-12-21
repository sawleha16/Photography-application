class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :album
  has_many :comments, dependent: :destroy
end

class Album < ApplicationRecord
  has_many_attached :images
   has_many :photos
  validates :name, presence: true
  validates :description, presence: true
end

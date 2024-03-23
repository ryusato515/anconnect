class Post < ApplicationRecord
  mount_uploader :photo_image, PhotoImageUploader

  belongs_to :user
  belongs_to :prefecture
  belongs_to :ingredient
  belongs_to :cooking_method
  has_many :favorites

  validates :comment, presence: true, length: { maximum: 140 }
end
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  belongs_to :ingredient
  belongs_to :cooking_method
  has_many :favorites
end
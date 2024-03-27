class Post < ApplicationRecord
  mount_uploader :photo_image, PhotoImageUploader

  belongs_to :user
  belongs_to :prefecture
  belongs_to :ingredient
  belongs_to :cooking_method
  has_many :favorites

  validates :comment, presence: true, length: { maximum: 140 }
  validates :name, presence: true
  validates :photo_image, presence: true
  validates :shop_name, presence: true
  
  scope :search_by_prefecture, -> (prefecture_id) { where(prefecture_id: prefecture_id) if prefecture_id.present? }
  scope :search_by_ingredient, -> (ingredient_ids) { where(ingredient_id: ingredient_ids) if ingredient_ids.present? }
  scope :search_by_cooking_method, -> (cooking_method_ids) { where(cooking_method_id: cooking_method_ids) if cooking_method_ids.present? }
  scope :search_by_name, -> (name) { where("name LIKE ?", "%#{name}%") if name.present? }
end
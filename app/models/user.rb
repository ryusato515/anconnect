class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  authenticates_with_sorcery!
  has_many :posts, dependent: :destroy 
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{5,}\z/ }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  def favorite(post)
    favorite_posts << post
  end

  def unfavorite(post)
    favorite_posts.destroy(post)
  end

  def favorite?(post)
    favorite_posts.include?(post)
  end
end

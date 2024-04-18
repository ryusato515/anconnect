class FavoritesController < ApplicationController
  before_action :set_user, only: %i[index]

  def index
    @favorite_posts = current_user.favorite_posts.includes(:user).order(created_at: :desc)
    @prefecture_id = params[:prefecture_id].presence
    @ingredient_ids = params[:ingredient_id] || []
    @cooking_method_ids = params[:cooking_method_id] || []
    @name = params[:name]
    @favorite_posts = @favorite_posts.search_by_prefecture(@prefecture_id)
                   .search_by_ingredient(@ingredient_ids)
                   .search_by_cooking_method(@cooking_method_ids)
                   .search_by_name(@name)
  end

  def create
    @post = Post.find(params[:post_id])
    current_user.favorite(@post)
  end

  def destroy
    @post = current_user.favorites.find(params[:id]).post
    current_user.unfavorite(@post)
  end

    private

  def set_user
    @user = User.find(session[:user_id])
  end

end
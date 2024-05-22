class MyPostsController < ApplicationController
  before_action :set_user, only: %i[index]

  def index
    @posts = current_user.posts.includes(:user, :prefecture, :ingredient, :cooking_method).order(created_at: :desc)
    @prefecture_id = params[:prefecture_id].presence
    @ingredient_ids = params[:ingredient_id] || []
    @cooking_method_ids = params[:cooking_method_id] || []
    @name = params[:name]
    @posts = @posts.page(params[:page]).per(12)
                   .search_by_prefecture(@prefecture_id)
                   .search_by_ingredient(@ingredient_ids)
                   .search_by_cooking_method(@cooking_method_ids)
                   .search_by_name(@name)
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end
end

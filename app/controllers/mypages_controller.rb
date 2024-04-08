class MypagesController < ApplicationController
  before_action :set_user, only: %i[index edit update show destroy]

  def index
    @posts = current_user.posts.includes(:user, :prefecture, :ingredient, :cooking_method).order(created_at: :desc)
    @prefecture_id = params[:prefecture_id].presence
    @ingredient_ids = params[:ingredient_id] || []
    @cooking_method_ids = params[:cooking_method_id] || []
    @name = params[:name]
    @posts = @posts.search_by_prefecture(@prefecture_id)
                   .search_by_ingredient(@ingredient_ids)
                   .search_by_cooking_method(@cooking_method_ids)
                   .search_by_name(@name)
  end
  

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to mypage_path, success: t('defaults.flash_message.updated', item: User.model_name.human)
    else
      flash.now['danger'] = t('defaults.flash_message.not_updated', item: User.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @user.destroy
    reset_session
    redirect_to root_path, notice: 'アカウントを削除しました。'
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name,:avatar,:avatar_cache)
  end
end
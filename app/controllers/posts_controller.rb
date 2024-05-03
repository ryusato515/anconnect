class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all.includes(:user, :prefecture, :ingredient, :cooking_method).order(created_at: :desc)
    @prefecture_id = params[:prefecture_id].presence
    @ingredient_ids = params[:ingredient_id] || []
    @cooking_method_ids = params[:cooking_method_id] || []
    @name = params[:name]
    @posts = @posts.search_by_prefecture(@prefecture_id)
                   .search_by_ingredient(@ingredient_ids)
                   .search_by_cooking_method(@cooking_method_ids)
                   .search_by_name(@name)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: t('defaults.flash_message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show;end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, success: t('defaults.flash_message.updated', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_updated', item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, success: t('defaults.flash_message.deleted', item: Post.model_name.human)
  end

  def favorites
    @favorite_posts = current_user.favorite_posts.includes(:user).order(created_at: :desc)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :photo_image, :prefecture_id, :shop_name, :address, :ingredient_id, :cooking_method_id, :comment, :photo_image_cache)
  end
end

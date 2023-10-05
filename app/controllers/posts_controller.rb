class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show]

  def index
    @posts = @user.posts.includes(:comments)
  end

  def show; end

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_posts_path(params[:user_id]), notice: 'Post created successfully.'
    else
      flash[:error] = @post.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    if @post.destroy
      redirect_to user_posts_path(@user), notice: 'Post was successfully deleted.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Failed to delete post.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end
end

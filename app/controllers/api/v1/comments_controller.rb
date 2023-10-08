class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  before_action :find_user
  before_action :find_post

  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @comment = @post.comments.build(user: current_user, text: comment_params[:text])
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_post
    @post = @user.posts.find(params[:post_id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end

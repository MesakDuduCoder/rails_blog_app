class CommentsController < ApplicationController
  before_action :set_user
  def create
    post_id = params[:post_id]
    user_id = params[:user_id]

    @comment = Comment.new(user_id: current_user.id, post_id:, text: comment_params[:text])
    puts @comment.inspect
    if @comment.save
      redirect_to user_post_path(user_id:, id: post_id), notice: 'Comment created successfully.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end

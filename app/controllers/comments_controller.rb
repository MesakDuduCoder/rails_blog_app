class CommentsController < ApplicationController
  def create
    post_id = params[:post_id]
    @comment = Comment.new(user_id: current_user.id, post_id:, text: comment_params[:text])
    puts @comment.inspect
    if @comment.save
      puts 'Comment saved successfully!'
      redirect_to user_post_path(current_user.id, post_id), notice: 'Comment created successfully.'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

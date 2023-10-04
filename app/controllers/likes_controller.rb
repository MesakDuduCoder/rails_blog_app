class LikesController < ApplicationController
  def create
    user_id = params[:user_id]
    post_id = params[:post_id]

    @like = Like.new(user_id:, post_id:)

    flash[:notice] = if @like.save
                       'Post liked successfully.'
                     else
                       'Unable to like the post.'
                     end
    redirect_to user_post_path(user_id:, id: post_id)
  end
end

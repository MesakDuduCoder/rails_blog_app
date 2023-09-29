class LikesController < ApplicationController
  def create
    user_id = params[:user_id]
    post_id = params[:post_id]

    @post = Post.find(post_id)

    @like = Like.new(user_id:, post_id:)

    if @like.save
      puts 'Post liked successfully.'
    else
      puts 'Unable to like the post.'
    end

    redirect_to user_post_path(user_id, post_id)
  end
end

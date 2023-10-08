class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @items = Post.all
    render json: @items
  end
end

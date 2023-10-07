class Api::V1::PostsController < ApplicationController
  def index
    @items = Post.all
    render json: @items
  end
end

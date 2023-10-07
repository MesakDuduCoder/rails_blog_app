class Api::V1::UsersController < ApplicationController
  def index
    @items = User.all
    render json: @items
  end
end

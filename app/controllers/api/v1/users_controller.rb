class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @items = User.all
    render json: @items
  end
end

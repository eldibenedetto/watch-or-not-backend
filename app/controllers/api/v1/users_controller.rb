class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    @user = User.create(user_params)
    render json: @user, include: [:movies], status: 201
  end

  def show
    @user = User.find_by(user_params)
    render json: @user, status: 201
  end

  private
  def user_params
    params.permit(:name, :username, :age, :gender)
  end

end

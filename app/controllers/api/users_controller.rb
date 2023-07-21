class Api::UsersController < ApplicationController
  before_action :find_user, only: [:destroy, :update]

  def show
    user = User.find(params[:id])
    render json: {status: 'Success', message: 'User found', data: user}, status: :ok
  end

  def index
    users = User.all
    render json: {status: 'Success', message: 'All users', data: users}, status: :ok
  end

  def create
    user = User.create(user_params)
    if @user.save
      render json: {status: 'Success', message: 'User created', data: user}, status: :ok
    else
      render json: {status: 'ERROR', message: 'User not created', data: user.errors}, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: {status: 'Updated', message: 'user successfully updated'}, status: :ok
  end

  def destroy
    user.destroy
    byebug
    render json: {status: 'Deleted', message: 'user successfully deleted'}, status: :ok
  end

  private

  def user_params
    params.require(:password, :email)
  end

  def find_user
    user = User.find(params[:data][:id])
  end
end

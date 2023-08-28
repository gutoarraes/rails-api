class Api::UsersController < ApplicationController
  before_action :has_api_key?

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
    if user.save
      render json: {status: 'success', message: 'User created', data: user}, status: :ok
    else
      render json: {status: 'ERROR', message: 'User not created', data: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: {status: 'success', message: 'user successfully updated'}, status: :ok
    else
      render json: { message: 'failed to update user', data: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {status: 'success', message: 'ser successfully deleted'}, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:password, :email)
  end

  def has_api_key?
    api_key = request.headers['X-Api-Key']
    if request.headers['X-Api-Key'] == Rails.application.credentials.api_key
    else
      render json: {message: 'no X-Api-Key'}
    end
  end

end

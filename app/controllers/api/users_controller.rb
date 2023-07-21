class Api::UsersController < ApplicationController

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
      render json: {status: 'Success', message: 'User created', data: user}, status: :ok
    else
      render json: {status: 'ERROR', message: 'User not created', data: user.errors}, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    render json: {status: 'Updated', message: 'user successfully updated'}, status: :ok
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {status: 'Deleted', message: 'user successfully deleted'}, status: :ok
  end

  private

  def user_params
    params.require(:password, :email).permit(:id)
  end
end

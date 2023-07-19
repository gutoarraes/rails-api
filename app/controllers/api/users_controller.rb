module Api
  class UsersController < ApplicationController
    before_action :find_user, only: [:destroy, :update]

    def index
      users = User.all
      render json: {status: 'Success', message: 'User created', data: users}, status: :ok
    end

    def create
      user = User.create(user_params)
      if @user.save
        render json: {status: 'Success', message: 'User created', data: user}, status: :ok
      else
        render json: {status: 'ERROR', message: 'User not created', data: user.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      @user.delete
      render json: {status: 'Deleted', message: 'user successfully deleted'}, status: :ok
    end

    def update
      @user.update(user_params)
      render json: {status: 'Updated', message: 'user successfully updated'}, status: :ok
    end

    private

    def user_params
      params.require(:name, :email)
    end

    def find_user
      @user = User.find(email: params[:email])
    end
  end
end

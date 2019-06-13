class UsersController < ApplicationController
  before_action :find_user, only: %i(show update destroy)

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: { error: user.errors }, status: 422
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { error: @user.errors }, status: 422
    end
  end

  def show
    render json: @user
  end

  def destroy
    @user.destroy

    render json: { message: 'success' }
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(User.allowed_attributes)
  end
end

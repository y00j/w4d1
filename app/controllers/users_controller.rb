class UsersController < ApplicationController
  def index
    @users = User.all
    # render plain: "I'm in the index action!"

    render json: @users
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
    render json: user
  end

  def show
    @user = User.find([params[:id]])
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    render json: User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end

class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user].permit(:username, :password))
    session[:user_id] = @user.id
    redirect_to '/'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :password_digest)
  end
end

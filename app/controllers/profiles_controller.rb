class ProfilesController < ApplicationController
  def index
    @other = params[:user_id]
    if session[:user_id] != nil
      @user = User.find(session[:user_id]) 
    else 
      @user = User.find(3) # a piece of duct tape
    end
    @person = User.find_by(id: params[:user_id])
    if @person.posts != nil 
      @post = @person.posts
    else
      @post = []
    end
  
    @profile = Profile.find_by(params[:id])
  end

  def show
 #   @thisGuy = User.find_by(username: params[:username])
 #   @profile = Profile.find_by(params[:id])
   # @user = @profile.user
  end

  def other
  end

  def new
  end

  def create
    @profile = Profile.new(new_profile_params)
    if @profile.valid?
      @user = User.find(session[:user_id])
      @profile.user_id = @user.id
      @profile.save
      redirect_to user_profiles_path 
    else 
      redirect_to user_profiles_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def new_profile_params
    params.require(:new_profile).permit(:name, :email, :city)
  end
end

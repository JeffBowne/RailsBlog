require 'bcrypt'

class HomeController < ApplicationController
  
  def index
    if session[:user_id] != nil
      @user = User.find_by(id: session[:user_id]).username
    else 
      @user = "Not logged in"
    end

    @post =  Post.all
    @list = User.all
    @myprofile = session[:user_id]
    @person = User.find_by(id: params[:user_id])
  end

  def login
    @sample = ['Blue','Red','Yellow']
  end


  def login_process
     user = User.find_by_username(params[:username])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end

end


    # if session[:user_id].nil?
    #   redirect_to '/signin'
    # else 
    #   redirect_to '/'
    # end 
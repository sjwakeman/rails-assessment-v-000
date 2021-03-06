class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def signin
    @user = User.new
  end

  def signup
    @user = User.new
  end

  def create
    #Checking for Facebook login
    if auth
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
    #Email and Password login
      @user = User.find_by(name: params[:user][:name])    
      if @user && @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user.id)
      else
        redirect_to signin_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private
 
  #Omniauth lesson template
  def auth
    request.env['omniauth.auth']
  end

end
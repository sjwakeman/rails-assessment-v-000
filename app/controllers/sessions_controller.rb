class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def signin
    @user = User.new
  end

  def signup
  end

  def create
    #binding.pry
    #if auth = request.env[‘omniauth.auth’]
    if auth
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      #binding.pry
      redirect_to user_path(@user.id)
    else
     @user = User.find_by(email: params[:@user][:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
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
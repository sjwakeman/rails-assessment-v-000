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
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
      session[:user_id] = @user.id
        render 'welcome/home'
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
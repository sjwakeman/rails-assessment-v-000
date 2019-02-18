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

  #def create
    #@user = User.find_by(name: params[:user][:name]) #Specify [:user][:name])
      #if @user && @user.authenticate(params[:user][:password])
      #session[:user_id] = @user.id
      #redirect_to user_path(@user) #Continue with @user
      #else
      #render 'new'#signin
      #redirect_to signin_path
      #end
  #end

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
    #session.destroy #:name
    #flash[:message] = "You have successfully logged out."
    #redirect_to '/'
    session[:user_id] = nil
    redirect_to root_url
  end
  
  private
 
  def auth
    request.env['omniauth.auth']
  end
end
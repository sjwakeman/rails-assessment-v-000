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
    @user = User.find_by(name: params[:user][:name]) #Specify [:user][:name])
      if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user) #Continue with @user
      else
      #render 'new'#signin
      redirect_to signin_path
      end
  end

  def destroy
    #session.destroy #:name
    #flash[:message] = "You have successfully logged out."
    #redirect_to '/'
    session[:user_id] = nil
    redirect_to root_url
  end
end

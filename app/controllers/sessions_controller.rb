class SessionsController < ApplicationController
  def signin
    @user = User.new
  end
  def create
    @user = User.find_by(name: params[:user][:name]) #Specify [:user][:name])
      if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user) #Continue with @user
      else
      render 'signin'
      end
  end
  def destroy
    session.destroy
    flash[:message] = "You have successfully logged out."
    redirect_to '/'
  end
end

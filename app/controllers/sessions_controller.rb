class SessionsController < ApplicationController

  def signup
    @user = User.new
  end

  def login
    @user = User.new
  end

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name]) #Specify [:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user) #Continue with @user
    else
      render 'login'
    end
  end


  #def create
    #user = User.find_or_create_by(:uid => auth['uid']) do |user|
      #user.name = auth['info']['name']
    #end
    #session[:user_id] = user.id
   #end

    def destroy
      session.destroy
      #reset session
       redirect_to '/'
    end

  private

  def auth
    request.env['omniauth.auth']
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :uid)
  end
end

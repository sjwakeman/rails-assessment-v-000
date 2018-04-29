class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
  def home
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  #def create
    #@user = User.find_by(name: params[:user][:name]) #Specify [:user][:name])
      #if @user && @user.authenticate(params[:user][:password])
        #session[:user_id] = @user.id
          #redirect_to user_path(@user) #Continue with @user
      #else
        #render 'login'
      #end
  #end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # UsersController create logs you in
        redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if params[:message]
      @message = params[:message] #Displays message
    else
      @message = "" #If no message prevents Error
    end
   #if !current_user.admin
    if current_user != @user
      redirect_to root_path
    end
   #end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :uid)
  end
end

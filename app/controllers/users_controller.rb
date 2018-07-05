class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #binding.pry
    if @user.save
      session[:user_id] = @user.id
      # UsersController create logs you in
        redirect_to user_path(@user)
        # new server request happens, so the previous controller
        #instance is destroyed and a new controller instance is created.
    else
      flash[:notice] = "Invalid name/password combination."
      render 'new'
      #When you render, you remain in the same controller instance
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if params[:message]
      @message = params[:message] #Displays message
    else
      @message = "" #If no message prevents Error
    end
      if current_user != @user
        redirect_to root_path
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :image, :uid)
  end

end

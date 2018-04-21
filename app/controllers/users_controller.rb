class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def new
    @user = User.new(user_params)
    if @user.save

  end

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


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end
end

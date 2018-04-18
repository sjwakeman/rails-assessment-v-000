class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def new
    @user = User.new(user_params)
    if @user.save

  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end
end

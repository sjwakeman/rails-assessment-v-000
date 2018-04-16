class TrainersController < ApplicationController

  private

  def user_params
    params.require(:user).permit(:name, :email, :specialty, :admin)
  end

end

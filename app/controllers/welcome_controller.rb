class WelcomeController < ApplicationController
  def home
    #@users = User.all
    @user = current_user
  end
end

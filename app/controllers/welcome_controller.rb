class WelcomeController < ApplicationController
   before_action :user_signed_in?

   def home
     @user = current_user
   end
end

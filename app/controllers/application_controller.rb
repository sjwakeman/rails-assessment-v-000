class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery


  private
  def current_user
#ApplicationController current_user returns the name of the current user
# ApplicationController current_user returns nil if nobody is logged in
    session[:name] ||= nil
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end

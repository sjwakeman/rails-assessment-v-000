class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  include Pundit  # add this line
  protect_from_forgery


  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end


  private

  def set_time_zone
    Time.zone = current_user.time_zone
  end

  #protected
  def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

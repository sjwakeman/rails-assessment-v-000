class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  private
  
  def set_time_zone
    Time.zone = current_user.time_zone
  end
end

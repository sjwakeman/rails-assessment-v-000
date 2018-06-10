module ApplicationHelper
  def omniauth_authorize_path(resource_name, provider)
    send "#{resource_name}_facebook_omniauth_authorize_path", provider
  end

  def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end
end

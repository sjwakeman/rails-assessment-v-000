Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, '2039406986315678', '797f992343d586343365b9272136c61f'
 #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end

Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
    provider :facebook,  '1644072325780517', '8f8555119a2b34f2941ea55b5050a41b'


  end

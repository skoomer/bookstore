# Rails.application.config.middleware.use OmniAuth::Builder do
#     require 'openid/store/filesystem'
#     provider :developer unless Rails.env.production?
#     # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
#     # provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
#     provider :openid, store: OpenID::Store::Filesystem.new('/tmp')
#   end
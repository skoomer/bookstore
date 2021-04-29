# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
    :user_name => 'bookstoregrid', # This is the string literal 'apikey', NOT the ID of your API key
    :password => '<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>', # This is the secret sendgrid API key which was issued during API key creation
    :domain => 'yourdomain.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }

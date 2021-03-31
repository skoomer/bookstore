source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'jquery-rails'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'circleci', require: false
# Devise is a flexible authentication solution for Rails based on Warden
gem 'devise'
# Standardized Multi-Provider Authentication
gem 'omniauth-github', github: 'intridea/omniauth-github'
gem 'omniauth-openid', github: 'intridea/omniauth-openid'
# OmniAuth Facebook
gem 'omniauth-facebook'
# Rails engine that provides an easy-to-use interface for managing your data.
gem 'activeadmin'
# Provides a set of helpers which guide you in leveraging regular Ruby classes 
gem "pundit"
# Pagy is the ultimate pagination gem
gem 'pagy', '~> 3.5'
# Shrine is a toolkit for handling file attachments in Ruby applications.
gem "shrine", "~> 3.0"
# Ruby state machines
gem 'aasm'
# Using MiniMagick the ruby processes memory remains small 
gem "mini_magick"
# Fast and powerful Git hooks manager for Node.js, Ruby or any other type of projects.
gem 'lefthook', '~> 0.5.5'
gem 'mimemagic', '~> 0.4.3'
gem 'jwt', '~> 2.2'





# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', '~> 1.12', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Ruby internationalization and localization (i18n) solution.
  gem 'i18n'
  # Haml is a templating engine for HTML.
  gem 'haml'
  gem 'pry-rails'
  gem 'database_consistency', group: :development, require: false
  # Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities.
  gem 'brakeman'
  #Check fast feature
  gem 'fasterer'
  # The Bullet gem is designed to help you increase your application's performance
  gem 'bullet', require: true

end

group :assets do
  gem 'compass', '~> 1.0'

end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  # Capture a screenshot for every test failure automatically!
  gem 'capybara-screenshot'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # Provides RSpec- and Minitest-compatible one-liners to test common Rails functionality 
  gem 'shoulda-matchers', '~> 4.0'
  # Rspec test
  gem 'rspec-rails', '~> 5.0.0'
  gem 'site_prism'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

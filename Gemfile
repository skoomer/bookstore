# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'circleci', require: false
gem 'jbuilder', '~> 2.7'
# Devise is a flexible authentication solution for Rails based on Warden
gem 'devise', '~> 4.7.3'
# Pagy is the ultimate pagination gem
gem 'pagy', '~> 3.5'
# Ruby state machines
gem 'aasm', '~> 5.1.1'
# Using MiniMagick the ruby processes memory remains small
gem 'mini_magick', '~> 4.11.0'
# Fast and powerful Git hooks manager for Node.js, Ruby or any other type of projects.
gem 'cancancan', '~> 3.2.1'
gem 'haml-rails', '~> 2.0.1'
gem 'image_processing', '~> 1.2'
gem 'jwt', '~> 2.2.2'
gem 'lefthook', '~> 0.5.5'
gem 'mimemagic', '~> 0.4.3'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
gem 'draper', '~> 4.0.1'
gem 'omniauth', '~> 1.4.1'
gem 'omniauth-facebook', '8.0.0'
gem 'simple_form'
gem 'rectify', '~> 0.13.0'
gem 'ffaker', '~> 2.18.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 11.1.3', platforms: %i[mri mingw x64_mingw]
  gem 'database_consistency', '~> 0.8.13', require: false
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop', '~> 1.12', require: false
  gem 'rubocop-performance', '~> 1.10.2', require: false
  gem 'rubocop-rails', '~> 2.9.1', require: false
  gem 'rubocop-rspec', '~> 2.2.0', require: false
  # Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilitie
  gem 'brakeman', '~> 5.0.0'
end

group :development do
  gem 'bullet', '~> 6.1.4'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.5.1'
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'fasterer', '~> 0.9.0'

  gem 'spring', '~> 2.1.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  # Capture a screenshot for every test failure automatically!
  gem 'capybara-screenshot', '~> 1.0.25'
  gem 'selenium-webdriver', '~> 3.142.7'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 4.6.0'
  # Provides RSpec- and Minitest-compatible one-liners to test common Rails functionality
  gem 'rails-controller-testing', '~> 1.0.5'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'simplecov', '~> 0.21.2', require: false
  gem 'site_prism', '~> 3.7.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2021.1', platforms: %i[mingw mswin x64_mingw jruby]

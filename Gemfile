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
gem 'jbuilder', '~> 2.7'
gem 'circleci', require: false
# Devise is a flexible authentication solution for Rails based on Warden
gem 'devise', '~> 4.7.3'
# Standardized Multi-Provider Authentication
# Rails engine that provides an easy-to-use interface for managing your data.
# Provides a set of helpers which guide you in leveraging regular Ruby classes 
gem "pundit", '~> 2.1.0'
# Pagy is the ultimate pagination gem
gem 'pagy', '~> 3.5'
# Shrine is a toolkit for handling file attachments in Ruby applications.
gem "shrine", "~> 3.0"
# Ruby state machines
gem 'aasm', '~> 5.1.1'
# Using MiniMagick the ruby processes memory remains small 
gem "mini_magick"
# Fast and powerful Git hooks manager for Node.js, Ruby or any other type of projects.
gem 'lefthook', '~> 0.5.5'
gem 'mimemagic', '~> 0.4.3'
gem 'jwt', '~> 2.2.2'
gem 'haml-rails', '~> 2.0.1'
gem 'cancancan', '~> 3.2.1'
gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :production, :development, :test do
  gem 'rspec-rails', '~> 5.0.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', '~> 1.12', require: false
  gem 'rubocop-rspec', '~> 2.2.0', require: false
  gem 'rubocop-rails', '~> 2.9.1', require: false
  gem 'rubocop-performance', '~> 1.10.2', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.5.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1.1'
  # Haml is a templating engine for HTML.
  gem 'pry-rails', '~> 0.3.9'
  gem 'database_consistency', '~> 0.8.13', group: :development, require: false
  # Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities.
  gem 'brakeman', '~> 5.0.0'
  #Check fast feature
  gem 'fasterer', '~> 0.9.0'
end

group :assets do
  gem 'compass', '~> 1.0'

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
  gem 'shoulda-matchers', '~> 4.0'
  # Rspec test
  
  gem 'site_prism', '~> 3.7.1'
  gem 'simplecov', '~> 0.21.2', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2021.1', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "devise"

gem "pundit"

gem "kaminari"

gem "redis-rails"

gem "sidekiq"

gem "faker"

gem "rubocop", require: false
gem "rubocop-performance"
gem "rubocop-rails"
gem "rubocop-rspec"
# gem 'rubocop-ci', git: 'https://github.com/ad2games/rubocop-ci'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1.4", ">= 6.1.4.1"
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4.2'

gem "pg"

# Use Puma as the app server
gem "puma", "~> 5.0"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 5.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

gem "rubycritic", require: false

group :production do
  gem "redis-rack-cache"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
<<<<<<< HEAD
=======
  gem "devise"
  gem "faker"
  gem "pagy"
  gem "pundit"
  gem "ransack"
  gem "redis-rails"
  gem "reek"
>>>>>>> e7ee9173... install pagy. uninstall kaminari
  gem "rspec-rails"
  gem "shoulda-matchers"
<<<<<<< HEAD
=======
  gem "sidekiq"
  gem "sidekiq-unique-jobs"
>>>>>>> d5bec4eb... pokemon db population begins with server initialization. Ransack add
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 4.1.0"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem 'bullet'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "fabrication"
  gem "rails-controller-testing"
  gem "rspec"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "rspec_junit_formatter"
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

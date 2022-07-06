# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "annotate"
gem "bootsnap", ">= 1.4.4", require: false
gem "figaro"
gem "hotwire-rails"
gem "jbuilder", "~> 2.7"
gem "pg"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.4", ">= 6.1.4.1"
gem "redis", "~> 4.0"
gem "rubocop", require: false
gem "rubocop-performance"
gem "rubocop-rails"
gem "rubocop-rspec"
gem "rubycritic", require: false
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "devise"
  gem "faker"
  gem "pagy"
  gem "pundit"
  gem "ransack"
  gem "redis-rails"
  gem "reek"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "sidekiq"
  gem "sidekiq-unique-jobs"
end

group :development do
  gem "bullet"
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara"
  gem "fabrication"
  gem "rspec"
  gem "rspec_junit_formatter"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

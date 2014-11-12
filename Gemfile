source "https://rubygems.org"

ruby "2.1.2"

gem 'bootstrap-sass', '~> 3.2.0'
gem "coffee-rails"
gem 'dynamic_form'
gem "email_validator"
gem "high_voltage"
gem "jquery-rails"
gem "pg"
gem "rack-timeout"
gem "rails", "4.1.4"
gem "recipient_interceptor"
gem "sass-rails", "~> 4.0.3"
gem "slim-rails"
gem "title"
gem "uglifier"
gem "unicorn"
gem "assignable_values"
gem "will_paginate"
gem "paranoia"

group :development do
  gem "foreman"
  gem "spring-commands-rspec"
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem "awesome_print"
  gem "byebug"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 2.14.0"
end

group :test do
  gem "capybara-webkit", ">= 1.2.0"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "newrelic_rpm", ">= 3.7.3"
end

# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.1.0"

gem "rails", "~> 6.1.4", ">= 6.1.4.1"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use Puma as the app server
gem "puma", "~> 5.0"
# enable CORS
gem "rack-cors"

gem "capybara"
gem "selenium-webdriver"
gem "chronic"

gem "grape"

group :development, :test do
  gem "rspec-rails", "~> 5.0.0", require: false
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", "~> 3.3"
end

source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'capistrano'
gem 'carrierwave'
gem 'devise'
gem 'timeline_fu'
gem 'haml'
gem 'haml-rails'
gem 'jquery-rails'
gem 'rails3-jquery-autocomplete'
gem 'simple_form'
gem 'thin'
gem 'twitter-bootstrap-rails'
gem 'whenever'
gem 'bootstrap-will_paginate'
gem 'sunspot_rails'
gem 'sunspot_solr'
gem 'mobylette'
gem 'jquery_mobile_rails'
gem 'rmagick'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer', :platform => :ruby
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
  gem 'guard-livereload'
  gem 'foreman'
  gem 'database_cleaner', '0.7.0'
  gem 'factory_girl_rails'
  gem "sextant"
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', '>=0.3.8', :require => false
  gem 'fakeweb'
  gem 'capybara'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'launchy', '2.0.5'
  gem 'ffaker'
end

group :production, :staging do
  gem 'mysql2'
end

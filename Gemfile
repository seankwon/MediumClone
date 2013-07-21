source 'https://rubygems.org'

gem 'rails', '4.0.0.rc1'

group :development, :test do
  gem 'pg'
  gem 'rspec-rails'
  gem 'factory_girl_rails', ">= 4.2.0"
end

group :test do
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'cucumber-rails', :require => false
end

group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails', '~> 4.0.0.rc1'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.0.1'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'devise'
# gem 'therubyracer', platforms: :ruby
# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
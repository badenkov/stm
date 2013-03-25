source 'https://rubygems.org'

gem 'rails', '3.2.13'


gem 'jquery-rails'
gem 'haml-rails'
gem 'twitter-bootstrap-rails'
gem 'simple_form'
gem 'virtus'
gem 'validates'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'less-rails'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'thin'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  # To use debugger
  # gem 'debugger'
  # Deploy with Capistrano
  # gem 'capistrano'
end

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'thin'
end


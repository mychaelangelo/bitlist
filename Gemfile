source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'

# Use PostgreSQL DB in Production as the database for Active Record
# Also add 'rails_12factor' gem, so can assets are in 12-factor compliant way
# Can read more here https://github.com/heroku/rails_12factor
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use sqlite3 DB in Development as the database for Active Record
group :development do
  gem 'sqlite3'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.0'
end

gem 'bootstrap-sass', '~> 3.1.1'

gem 'bootswatch-rails'

gem 'faker'

gem 'devise'

# gem to handle env variables
gem 'figaro'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'capistrano', '~> 3.2.1'

# Use debugger
# gem 'debugger', group: [:development, :test]


# installing twitter and facebook login ability
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'

# Whenever Gem for writing and deploying cron jobs
gem 'whenever', :require => false

# Cool fonts (http://fortawesome.github.io/Font-Awesome/)
gem "font-awesome-rails"


source 'https://rubygems.org'

# The current ruby stable version
ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

# Use PostgreSQL for the db
gem 'pg', '0.15.1'

# Use SCSS for stylesheets
gem 'sass-rails', '5.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

group :development do
  # Access errors in the web browser
  gem 'better_errors'

  # Annotate all models with DB schema
  gem 'annotate'
end

group :development, :test do
  # Unit testing with rspec
  gem 'rspec-rails', '~> 3.0'

  # Model factories
  gem 'factory_girl', '4.5.0'

  # Database cleaner for faster tests
  gem 'database_cleaner', '1.4.1'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api
  gem 'sdoc', '0.4.0'
end

group :staging, :production do
  # Use Unicorn as the app server
  gem 'unicorn'
end


source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1', '>= 7.1.1'

# Use sqlite3 as the database for Active Record


# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 6.4'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
gem 'faraday'
gem 'pagy'
gem 'pg'
gem 'rack-cors', require: 'rack/cors'
gem 'rollbar'
gem 'sidekiq'

#Swagger documentation
gem 'rswag'
gem 'rswag-api'
gem 'rswag-ui'
gem 'rspec-rails'
gem 'factory_bot_rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "sqlite3", "~> 1.4"
  gem 'pry-byebug'
end

group :development do
  gem 'web-console'
  gem 'better_errors'
  gem 'binding_of_caller'
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end



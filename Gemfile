source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'
# rails
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# routes
gem 'grape'
# entity
gem 'grape-entity'
# db
gem 'pg'
# redis
gem 'redis-rails'
# sidekiq, scheduler
gem 'sidekiq', '~> 6.0.5', '>= 6.0.5'
gem 'sidekiq-scheduler'

# Use Puma as the app server
gem 'puma', '~> 4.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

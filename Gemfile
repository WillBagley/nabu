source 'https://rubygems.org'

gem 'rails', '3.2.16'

# Databases
gem 'mysql2'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'

  gem 'therubyracer'
  gem 'libv8'

  gem 'uglifier', '>= 1.0.3'
end

# Views
gem 'jquery-rails'
gem 'haml-rails'
gem 'to-csv', :require => 'to_csv'
gem 'kaminari'
gem 'oai'
gem 'analytical'

# Admin
gem 'country-select'
gem 'activeadmin'
gem 'sass-rails',  '~> 3.2.3'
gem 'meta_search', '>= 1.1.0.pre'
gem 'sass', '3.2.10'

# Authentications
gem 'devise', '2.2.3'
gem 'cancan'

# Database improvements
gem 'squeel'
gem 'nilify_blanks'

# Search
gem 'sunspot_solr', '~> 2.0.0'
gem 'sunspot_rails', '~> 2.0.0'

# Web Server
gem 'unicorn'

# Media Detection
gem 'ruby-filemagic'

# Deployment
gem 'capistrano'
gem 'capistrano-unicorn'

# Logging
gem 'rollbar'

# Misc
gem 'progress_bar'
gem 'paper_trail', '~> 2'
gem 'quiet_assets'
gem 'spreadsheet'
gem 'rake'

group :development, :test do
  gem 'turn', '~> 0.8.3', :require => false
  gem 'rspec-rails', '~> 2.0'
  gem 'sextant'
  gem 'thin'

  gem 'spring'
  gem 'spring-commands-rspec'

  # Guard
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-sunspot'

  gem 'rb-inotify', :require => RUBY_PLATFORM.include?('linux') ? 'rb-inotify' : false
  gem 'rb-fsevent', :require => RUBY_PLATFORM.include?('darwin') ? 'rb-fsevent' : false
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'factory_girl_rails'
  gem 'email_spec'
  gem 'launchy'
end

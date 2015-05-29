source 'https://rubygems.org'

# Heroku uses the ruby version to configure your application's runtime.
#
# Technically, `File.read('.ruby-version').strip` will do the trick, but
# if the Gemfile is loaded from outside the app root dir, then it won't
# properly parse the `.ruby-version` file.
ruby File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip

gem 'puma'
gem 'rack-canonical-host'
gem 'rails', '~> 4.2.1'
gem 'pg'

gem 'slim-rails'
gem 'sass-rails'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'simple_form'
gem 'uglifier'

gem 'awesome_print'

gem 'devise'
gem 'activeadmin', '~> 1.0.0.pre1'
gem 'redcarpet'
gem 'autoprefixer-rails'

group :production, :acceptance do
  gem 'rack-timeout'
  gem 'rails_stdout_logging'
  gem 'heroku_rails_deflate'
end

group :test do
  gem 'fuubar'
  gem 'capybara'
  #gem 'capybara-email'
  gem 'poltergeist'
  #gem 'timecop'
  gem 'database_cleaner'
  gem 'simplecov'
  gem 'shoulda-matchers'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'jasmine-rails'
  gem 'ffaker'
  #gem 'cane'
  #gem 'morecane'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'foreman'
  gem 'launchy'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'guard', '~> 2'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'rb-fsevent'
  gem 'growl'
end

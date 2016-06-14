source 'https://rubygems.org'

# Heroku uses the ruby version to configure your application's runtime.
#
# Technically, `File.read('.ruby-version').strip` will do the trick, but
# if the Gemfile is loaded from outside the app root dir, then it won't
# properly parse the `.ruby-version` file.
ruby File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip

gem 'puma'
gem 'rack-canonical-host'
gem 'rails', '~> 4.2.6'
gem 'pg'

gem 'slim-rails'
gem 'sass-rails'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'simple_form'
gem 'uglifier'

gem 'awesome_print'

gem 'devise', '~> 3.5.10'
gem 'activeadmin', '~> 1.0.0.pre1'
gem 'redcarpet', '~> 3.3.4'
gem 'sanitize', '~> 4.0.1'
gem 'autoprefixer-rails'

gem 'ransack', '~> 1.6.6'
gem 'rakismet', '~> 1.5.1'

group :production, :acceptance do
  gem 'rack-timeout'
  gem 'rails_stdout_logging'
  gem 'heroku_rails_deflate'
end

group :test do
  gem 'fuubar'
  gem 'capybara'
  #gem 'capybara-email'
  gem 'codeclimate-test-reporter', require: false
  gem 'coveralls', require: false
  gem 'poltergeist'
  #gem 'timecop'
  gem 'database_cleaner'
  gem 'simplecov'
  gem 'shoulda-matchers'
end

group :test, :development do
  gem 'dotenv-rails', '~> 2.0.2'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'jasmine-rails'
  gem 'ffaker'
  #gem 'cane'
  #gem 'morecane'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
  gem 'growl'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'guard', '~> 2'
  gem 'launchy'
  gem 'quiet_assets'
  gem 'rb-fsevent'
  gem 'spring-commands-rspec'
  gem 'spring'
end

source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'bootstrap', '~> 4.0.0.alpha6'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# gem 'rails', github: 'rails/rails'

gem 'galleriable', github: 'schadenfred/galleriable'#, require: false

gem 'devise'
gem 'simple_form'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
gem 'ember-cli-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'haml-rails'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'backstretch-rails'

gem 'redcarpet'

gem 'seedbank'


gem 'font-awesome-rails'
gem 'ionicons-rails'


gem 'active_model_serializers', '~> 0.10.0'

source 'https://rails-assets.org' do
    gem 'rails-assets-tether', '>= 1.1.0'
  end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
gem 'faker'

gem 'faker-stoked', github: 'schadenfred/faker-stoked'#, tag: 'v0.2.8'
  gem 'vinbot'

  gem 'byebug', platform: :mri

  gem 'minitest-rails'

  gem 'factory_girl_rails'

  gem 'guard'
  gem 'guard-minitest'
  gem 'guard-livereload'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do

  gem 'minitest-rails-capybara'
  gem 'capybara-email'

  gem 'selenium-webdriver'
  gem 'minitest-given'

  # required for testing serializers
  gem 'json_schema'
  # mocks & stubs
  gem 'mocha'

  # for save_and_open_page method in capybara to work
  gem 'launchy'

  # clean out database between runs
  gem 'database_cleaner'

  # nyan cat, motherfuckers:
  gem 'minitest-nyan-cat'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

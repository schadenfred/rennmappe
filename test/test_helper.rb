ENV["RAILS_ENV"] = 'test'

require File.expand_path("../../config/environment", __FILE__)

require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'database_cleaner'
require 'minitest/given'
require 'minitest/nyan_cat'
require 'tilt/redcarpet'
require 'capybara/email'



Dir[File.expand_path('test/support/*.rb')].each { |file| require file }
include TestMatchers
include FactoryGirl::Syntax::Methods

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include Warden::Test::Helpers
  include Capybara::Email::DSL

  # Warden.test_mode!
  # after { Warden.test_reset! }
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Assertions
  include Devise::Test::IntegrationHelpers
end

class ActionDispatch::IntegrationTest
end
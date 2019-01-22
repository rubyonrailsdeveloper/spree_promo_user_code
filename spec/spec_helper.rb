require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy/config/environment.rb',  __FILE__)

require 'rspec/rails'
require 'ffaker'
require 'shoulda-matchers'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/factories'
require 'spree/testing_support/url_helpers'
require 'rspec/active_model/mocks'

require 'spree_promo_users_codes/factories'

# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }


RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  # Infer an example group's spec type from the file location.
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false

  config.include Spree::TestingSupport::UrlHelpers
  config.include Spree::TestingSupport::ControllerRequests, type: :controller

  config.mock_with :rspec
  config.color = true

  config.fail_fast = ENV['FAIL_FAST'] || false
  config.order = "random"

  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
end

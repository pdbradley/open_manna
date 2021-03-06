ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'webmock/rspec'
require 'support/factory_girl'
require 'support/warden'
require 'support/shoulda_matchers'
require 'support/rspec_sidekiq'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
WebMock.disable_net_connect!(allow_locahost: true)
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  config.include MailerMacros
  config.before(:each) { reset_email }
end

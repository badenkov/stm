if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!
end

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include AuthHelper

  # Add more helper methods to be used by all tests here...
  require 'factory_girl_rails'
  include FactoryGirl::Syntax::Methods
end

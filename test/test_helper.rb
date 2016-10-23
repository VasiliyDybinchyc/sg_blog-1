ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"

class ActiveSupport::TestCase
  include Capybara::DSL
  Capybara.default_driver = :rack_test
  DatabaseCleaner.strategy = :truncation
  Capybara.default_max_wait_time = 5
  self.use_transactional_fixtures = false

  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
    Capybara.reset_sessions!
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  DatabaseCleaner.strategy = :truncation
  Capybara.default_driver = :webkit
  Capybara.javascript_driver = :webkit
  Capybara.default_max_wait_time = 5

  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
    Capybara.reset_sessions!
  end
end


def create_ten_posts
  10.times { |n| Post.create(title: "a_#{n}"*3, body: "AAAA#{n}"*50) }
end

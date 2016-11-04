ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"
require 'database_cleaner'

class ActiveSupport::TestCase
  include Capybara::DSL
  include Rails.application.routes.url_helpers
  DatabaseCleaner.strategy = :truncation
  self.use_transactional_fixtures = false
  fixtures :all

  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
    Capybara.reset_sessions!
  end
end

class IntegrationWebkitTest < ActiveSupport::TestCase
  Capybara.current_driver = :webkit
  Capybara.javascript_driver = :webkit
  Capybara.default_max_wait_time = 5
end

def create_ten_posts
  10.times { |n| Post.create(title: "a_#{n}"*3, body: "AAAA#{n}"*50) }
end

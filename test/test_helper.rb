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
  Capybara::Webkit.configure do |config|
    config.allow_unknown_urls
    config.ignore_ssl_errors
  end
end

def create_ten_posts
  10.times { |n| Post.create(title: "a_#{n}"*3, body: "AAAA#{n}"*50) }
end

def login(user)
  visit login_path
  fill_in("session_email", :with => user.email)
  fill_in("session_password", :with => "password")
  click_button "Log in"
end

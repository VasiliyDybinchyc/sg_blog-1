ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"

class ActiveSupport::TestCase
  include Capybara::DSL
end

def create_ten_posts
  10.times { |n| Post.create(title: "a_#{n}"*3, body: "AAAA#{n}"*50) }
end

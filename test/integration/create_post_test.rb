require "test_helper"

class CreatePostTest < ActiveSupport::TestCase
  def setup
    visit "/posts/new"
  end

  def test_create_new_post
    fill_in("Title", :with => "True title")
    fill_in("Body", :with => "TEXT TEXT TEXT"*20)
    click_button "Create Post"
    assert_equal 1, Post.all.count
  end

  def test_show_error_message_when_post_should_not_be_created_because_of_the_title_wrong
    fill_in("Title", :with => "F")
    fill_in("Body", :with => "TEXT TEXT TEXT"*20)
    click_button "Create Post"
    assert page.has_content?("Sorry, your post is not valid. Please, try again.")
  end

  def test_show_error_message_when_post_should_not_be_created_because_of_the_body_wrong
    fill_in("Title", :with => "True title")
    fill_in("Body", :with => "T"*20)
    click_button "Create Post"
    assert page.has_content?("Sorry, your post is not valid. Please, try again.")
  end

end

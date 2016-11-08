require "test_helper"

class CreatePostTest < ActiveSupport::TestCase
  def setup
    @user = users(:vasiliy)
    login(@user)
    visit "/posts/new"
  end

  def test_create_new_post
    fill_in("post_title", :with => post_content[:title][:valid])
    fill_in("post_body", :with => post_content[:body][:valid])
    click_button "Make'em read!"
    assert page.has_content?(post_content[:title][:valid])
    assert_equal 1, Post.all.count
  end

  def test_show_error_message_when_post_should_not_be_created_because_of_the_title_invalid
    fill_in("post_title", :with => post_content[:title][:invalid])
    fill_in("post_body", :with => post_content[:body][:valid])
    click_button "Make'em read!"
    assert page.has_content?("Sorry, your post is not valid. Please, try again.")
  end

  def test_show_error_message_when_post_should_not_be_created_because_of_the_body_invalid
    fill_in("post_title", :with => post_content[:title][:valid])
    fill_in("post_body", :with => post_content[:body][:invalid])
    click_button "Make'em read!"
    assert page.has_content?("Sorry, your post is not valid. Please, try again.")
  end

  private
  def post_content
    {:title => {:valid => "True title",
                :invalid => "F"},
     :body => {:valid => "TEXT TEXT TEXT"*20,
               :invalid => "F"}}
  end
end

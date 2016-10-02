require "test_helper"

class EditPostTest < ActiveSupport::TestCase

  def setup
    create_ten_posts
    visit "/posts/6/edit"
  end

  def test_good_edit_post_title_and_see_upgrade
    fill_in("Title", :with => "True title1")
    click_button "Update Post"
    assert page.has_content?("True title1")
  end

  def test_good_edit_post_body_and_see_upgrade
    fill_in("Body", :with => "TEXT1 TEXT1 TEXT1"*20)
    click_button "Update Post"
    assert page.has_content?("TEXT1 TEXT1 TEXT1"*20)
  end

  def test_bad_edit_post_title_and_see_error
    fill_in("Title", :with => "F")
    click_button "Update Post"
    assert page.has_content?("Sorry, your update is not valid. Please, try again.")
  end

  def test_bad_edit_post_body_and_see_error
    fill_in("Body", :with => "F")
    click_button "Update Post"
    assert page.has_content?("Sorry, your update is not valid. Please, try again.")
  end

end

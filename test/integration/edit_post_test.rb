require "test_helper"

class EditPostTest < ActiveSupport::TestCase

  def setup
    create_ten_posts
    visit "/posts/6/edit"
  end

  def test_good_edit_post_title_and_see_upgrade
    fill_in("post_title", :with => post_content[:title][:valid])
    click_button "Now its OK"
    assert page.has_content?(post_content[:title][:valid])
  end

  def test_good_edit_post_body_and_see_upgrade
    fill_in("post_body", :with => post_content[:body][:valid])
    click_button "Now its OK"
    assert page.has_content?(post_content[:body][:valid])
  end

  def test_bad_edit_post_title_and_see_error
    fill_in("post_title", :with => post_content[:title][:invalid])
    click_button "Now its OK"
    assert page.has_content?("Sorry, your update is not valid. Please, try again.")
  end

  def test_bad_edit_post_body_and_see_error
    fill_in("post_body", :with => post_content[:body][:invalid])
    click_button "Now its OK"
    assert page.has_content?("Sorry, your update is not valid. Please, try again.")
  end

  private

  def post_content
    {:title => {:valid => "True title",
                :invalid => "F"},
     :body => {:valid => "TEXT TEXT TEXT"*20,
               :invalid => "F"}}
  end

end

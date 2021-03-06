require "test_helper"

class FormTest < ActiveSupport::TestCase

  def setup
    @user = users(:vasiliy)
    login(@user)
    create_ten_posts
    visit "/posts/6/edit"
  end

  def test_visit_edit_and_new_page_and_see_three_field
    assert_equal 3, page.all("div.form-group").count
  end

  def test_visit_edit_and_new_page_and_see_
    assert page.all("p.notice")
  end

  def test_button_delete_post_and_update_post
    assert page.all("div.actions")
  end

end

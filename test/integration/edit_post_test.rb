require "test_helper"

class EditPostTest < ActiveSupport::TestCase
  def setup
    create_ten_posts
    visit "/posts/6/edit"
  end

  def test_edit_post_title
    fill_in("Title", :with => "True title1")
    click_button "Update Post"
    assert page.has_content?("True title1")
  end

  def test_edit_post_body
    fill_in("Body", :with => "TEXT1 TEXT1 TEXT1"*20)
    click_button "Update Post"
    assert page.has_content?("TEXT1 TEXT1 TEXT1"*20)
  end


  def create_ten_posts
    10.times { |n| Post.create(title: "a_#{n}"*3, body: "AAAA#{n}"*50) }
  end

end

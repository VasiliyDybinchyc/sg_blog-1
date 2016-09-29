require "test_helper"

class ShowPageTest < ActiveSupport::TestCase

  def setup
    create_ten_posts
    visit "/posts/6"
  end

  def test_visit_show_page_and_see_one_post_titles
    assert_equal 1, page.all("p.post-title").count
  end

  def test_visit_show_page_and_see_one_post_body
    assert_equal 1, page.all("p.post-body").count
  end

  def test_visit_show_page_and_see_corect_post_body
    assert page.has_text?('AAAA5'*50)
  end

  def test_visit_show_page_and_see_corect_post_title
    assert page.has_text?('a_5'*3)
  end

  def test_button_Edit_Post
    assert page.has_button?("Edit Post")
  end

  def test_button_Delete_Post
    assert page.has_button?("Destroy")
  end

  def create_ten_posts
    10.times { |n| Post.create(title: "a_#{n}"*3, body: "AAAA#{n}"*50) }
  end

end

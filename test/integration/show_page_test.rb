require "test_helper"

class ShowPageTest < ActiveSupport::TestCase

  def setup
    create_ten_posts
    visit "/posts/6"
  end

  def test_visit_show_page_and_see_one_post_titles
    assert_equal 1, page.all("h2.post-title").count
  end

  def test_visit_show_page_and_see_one_post_body
    assert_equal 1, page.all("article.post-body").count
  end

  def test_visit_show_page_and_see_corect_post_body
    assert page.has_text?('AAAA5'*50)
  end

  def test_visit_show_page_and_see_corect_post_title
    assert page.has_text?('a_5'*3)
  end

  def test_button_Edit_Post
    assert page.has_link?("Edit Post")
  end

  def test_button_Delete_Post
    assert page.has_link?("Delete post")
  end

  def test_destroy_post
    assert_difference "Post.count", -1 do
      click_link "Delete post"
    end
  end

  def test_go_to_edit
    click_link "Edit Post"
    assert page.has_selector?("form")
  end

  def test_create_comments
    fill_in("comment_commenter", :with => "Vasiliy Pupkin")
    fill_in("comment_body", :with => "Hello!")
    click_button "Create Comment"
    assert_equal 1, Comment.all.count
  end

  def test_create_comments_and_see_him_in_show_page
    fill_in("comment_commenter", :with => "Vasiliy Pupkin")
    fill_in("comment_body", :with => "Hello!")
    click_button "Create Comment"
    assert page.has_text?('Hello!')
  end

end

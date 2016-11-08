require "test_helper"

class ShowPagePostTest < ActiveSupport::TestCase

  def setup
    @user = users(:vasiliy)
    login(@user)
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
      page.accept_confirm { click_link "Delete post" }
    end
  end

  def test_go_to_edit
    click_link "Edit Post"
    assert page.has_selector?("form")
  end
end

class CommentTest < IntegrationWebkitTest
  def setup
    @user = users(:vasiliy)
    login(@user)
    Post.create(title: "aaaa1", body: "A"*200)
  end

  def test_create_new_valid_comment
   visit post_path(id: 1)
   find("#comment_body").set("Some comment")
   click_on "Create Comment"
   assert page.has_content? ("Some comment")
 end

 def test_valid_coment_edit
    Post.all[0].comments.create(:body => "Comment")
    visit post_path(id: 1)
    within("#comment-1") { click_on "Edit" }
    within("div.comment-edit-forms") do
      find("#comment_body").set("Some comment")
      click_on "Update comment"
    end
    within("#comment-1") { assert page.has_content? ("Some comment") }
    assert_equal 0, page.all(".comment-edit-forms").count
  end
end

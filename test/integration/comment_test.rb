class CommentTest < ActionDispatch::IntegrationTest
  def setup
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

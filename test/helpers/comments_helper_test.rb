require 'test_helper'

class CommentsHelperTest < ActionView::TestCase

  def setup
    Comment.create(post_id: 1, body: "hello")
  end

  def test_comment_body_return_corect_format_comment
    body = "<div class='list-group-item'><p>hello</p><p>#{comment_time(Comment.all.first.created_at)}</p><a data-remote=true href='/posts/1/comments/1/edit'>Edit</a></div>"
    assert_equal  body, comment_body(Comment.all.first)
  end

  def test_comment_time_return_corect_format_time
    time = "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}"
    assert_equal time, comment_time(Comment.all.first.created_at)
  end

end

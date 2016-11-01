require 'test_helper'

class PostsHelperTest < ActionView::TestCase

  def test_limited_posts_body_returns_only_100_symbols_post_body
    assert_equal "a"*100 + "...", limited_posts_body("a"*150)
  end

end

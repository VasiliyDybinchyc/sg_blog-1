class EditPostTest < ActiveSupport::TestCase
  def setup
    create_ten_posts
    visit "/posts/6"
  end

  def test_destroy_post
    click_link "Destroy"
    visit "/"
    assert_equal 9, page.all("li.post-title").count
  end

  def create_ten_posts
    10.times { |n| Post.create(title: "a_#{n}"*3, body: "AAAA#{n}"*50) }
  end

end

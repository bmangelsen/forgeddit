require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "can create post and build relationship" do
    Post.create!(name: "Cool pic!", link: "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg", user_id: users(:ben).id)
    assert_equal "Cool pic!", users(:ben).posts.last.name
  end
end

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "can get posts index view" do
    get posts_path
    assert_match(/Here are all the posts!/, response.body)
  end

  test "can get user posts index view" do
    post session_path, params: { username: users(:ben).username, password: "test" }
    get user_posts_path(users(:ben).id)
    assert_match(/Here are all your posts!/, response.body)
  end
end

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "can get posts index view" do
    post session_path, params: { username: users(:ben).username, password: "test" }
    get posts_path
    assert_match(/Here are all the posts!/, response.body)
  end

  test "can get user posts index view" do
    post session_path, params: { username: users(:ben).username, password: "test" }
    get user_posts_path(users(:ben).id)
    assert_match(/Here are all your posts!/, response.body)
  end

  test "can get new post view" do
    post session_path, params: { username: users(:ben).username, password: "test" }
    get new_post_path
    assert_match(/Enter the info for your new post!/, response.body)
  end

  test "can create new post" do
    post posts_path, params: { post: { name: "OMG cat pic", link: "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg", user_id: users(:ben).id }}
    assert_equal "OMG cat pic", Post.last.name
  end

  test "can get post edit view" do
    post session_path, params: { username: users(:ben).username, password: "test" }
    get edit_post_path(posts(:bens_post).id)
    assert_match(/Edit the details of your post!/, response.body)
  end

  test "can edit post" do
    post session_path, params: { username: users(:ben).username, password: "test" }
    patch post_path(posts(:bens_post).id), params: { post: { name: "new post name" }}
    assert_equal "new post name", Post.find(posts(:bens_post).id).name
  end

  test "can delete post" do
    post session_path, params: { username: users(:ben).username, password: "test" }
    delete post_path(posts(:bens_post).id)
    assert 2, Post.count
  end
end

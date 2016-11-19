require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "can get comments index for a post" do
    get post_comments_path(posts(:bens_post).id)
    assert_match(/Comments for this post:/, response.body)
  end

  test "can get new comment view" do
    new_session(:ben)
    get new_post_comment_path(posts(:bens_post).id)
    assert_match(/Enter the info for your new comment!/, response.body)
  end

  test "can create comment" do
    new_session(:ben)
    post post_comments_path(posts(:bens_post).id), params:
    {
      comment:
      {
        content: "yay a comment",
        user_id: users(:ben).id,
        post_id: posts(:bens_post).id
      }
    }
    assert_equal "yay a comment", posts(:bens_post).comments.last.content
  end

  test "can get edit comment view" do
    new_session(:ben)
    get edit_post_comment_path(posts(:bens_post).id, comments(:bens_comment))
    assert_match(/Edit the details of your comment!/, response.body)
  end

  test "can edit comment" do
    new_session(:ben)
    patch post_comment_path(posts(:bens_post).id, comments(:bens_comment)), params:
    {
      comment:
      { content: "i updated it" }
    }
    assert_equal "i updated it", Comment.find(comments(:bens_comment).id).content
  end

  test "can delete comment" do
    new_session(:ben)
    delete post_comment_path(posts(:bens_post).id, comments(:bens_comment))
    assert_equal 2, Comment.count
  end
end

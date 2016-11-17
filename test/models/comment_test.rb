require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "can create comment and build relationship" do
    Comment.create!(content: "Cool pic OMG", user_id: users(:ben).id, post_id: posts(:bens_post).id)
    assert_equal "Cool pic OMG", users(:ben).comments.last.content
    assert_equal "Cool pic OMG", posts(:bens_post).comments.last.content
  end
end

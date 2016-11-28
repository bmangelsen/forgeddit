require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  test "can create a vote" do
    new_session(:ben)
    post votes_path, params:
    {
      vote:
      {
        value: 1,
        user_id: users(:ben).id,
        post_id: posts(:bens_post).id
      }
    }
    assert_equal 1, Vote.where(post_id: posts(:bens_post).id).sum(:value)
  end
end

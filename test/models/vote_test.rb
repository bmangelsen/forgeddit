require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "can create a vote" do
    Vote.create!(value: 1, user_id: users(:ben).id, post_id: posts(:bens_post).id)
    assert_equal 1, Vote.count
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create user" do
    User.create!(username: "Jimmy", email: "jimmy@thedigs.com")
    assert_equal "Jimmy", User.last.username
  end
end

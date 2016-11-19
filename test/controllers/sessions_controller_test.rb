require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "can get new session view" do
    get new_session_path
    assert_match(/Log in to post or comment!/, response.body)
  end

  test "can create new session" do
    new_session(:ben)
    assert_equal users(:ben).id, session["current_user_id"]
  end

  test "can terminate session" do
    new_session(:ben)
    assert_equal users(:ben).id, session["current_user_id"]
    delete session_path(users(:ben).id)
    assert_equal nil, session["current_user_id"]
  end
end

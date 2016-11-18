require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "can get new session view" do
    get new_session_path
    assert_match(/Log in to post or comment!/, response.body)
  end

  test "can create new session" do
    post session_path, params: { username: users(:ben).username, password: "test" }
    assert_equal users(:ben).id, session["current_user_id"]
  end
end

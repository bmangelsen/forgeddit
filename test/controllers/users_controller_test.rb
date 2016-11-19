require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "can get create user view" do
    get new_user_path
    assert_match(/Create an account!/, response.body)
  end

  test "can create new user" do
    post users_path, params:
    { user:
      {
        username: "Jimmy",
        email: "jimmy@thedigs.com",
        password: "test"
      }
    }
    assert_equal "Jimmy", User.last.username
  end

  test "can get show profile view" do
    new_session(:ben)
    get user_path(users(:ben).id)
    assert_match(/Your Profile/, response.body)
  end

  test "can get update user view" do
    new_session(:ben)
    get edit_user_path(users(:ben).id)
    assert_match(/Update your Info!/, response.body)
  end

  test "can update user" do
    new_session(:ben)
    patch user_path(users(:ben).id), params:
    {
      user:
      { username: "Benjamin" }
    }
    assert_equal "Benjamin", User.find(users(:ben).id).username
  end

  test "can get update user password view" do
    new_session(:ben)
    get edit_password_user_path(users(:ben).id)
    assert_match(/Update your password!/, response.body)
  end

  test "can update user password" do
    new_session(:ben)
    patch edit_password_user_path(users(:ben).id), params:
    {
      user:
      {
         password: "hooray",
         password_confirmation: "hooray"
      }
    }
    assert_response 302
    delete session_path(users(:ben).id)
    post session_path, params:
      {
        username: users(:ben).username,
        password: "hooray"
      }
    assert_equal (users(:ben).id), session["current_user_id"]
  end
end

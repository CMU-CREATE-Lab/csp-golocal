require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get login page" do
    get user_login_url
    assert_response :success
  end

  test "should log in with valid credentials" do
    log_in_as(@user)
    assert_redirected_to "/user/home"

    follow_redirect!
    assert_response :success
  end

  test "should reject invalid credentials" do
    log_in_as(@user, password: "wrong")
    assert_response :unprocessable_entity
    assert_match "Username or password was invalid", response.body
  end

  test "should redirect login page to home when already logged in" do
    log_in_as(@user)
    get user_login_url
    assert_redirected_to "/user/home"
  end

  test "should log out" do
    log_in_as(@user)
    get logout_url
    assert_redirected_to "/user/login"

    get home_user_index_url
    assert_redirected_to "/user/login"
  end

  test "should redirect home to login when logged out" do
    get home_user_index_url
    assert_redirected_to "/user/login"
  end
end

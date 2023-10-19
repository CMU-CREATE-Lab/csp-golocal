require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get user_login_url
    assert_response :success
  end

  test "should get logout" do
    get user_logout_url
    assert_response :success
  end

  test "should get home" do
    get user_home_url
    assert_response :success
  end

  test "should get index" do
    get user_index_url
    assert_response :success
  end

  test "should get new" do
    get user_new_url
    assert_response :success
  end

  test "should get create" do
    get user_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_destroy_url
    assert_response :success
  end
end

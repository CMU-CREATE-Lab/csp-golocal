require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get demo1" do
    get home_demo1_url
    assert_response :success
  end

  test "should get demo2" do
    get home_demo2_url
    assert_response :success
  end
end

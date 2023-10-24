require "test_helper"

class KeywordControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get keyword_index_url
    assert_response :success
  end

  test "should get new" do
    get keyword_new_url
    assert_response :success
  end

  test "should get edit" do
    get keyword_edit_url
    assert_response :success
  end
end

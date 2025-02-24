require "test_helper"

class BusinessSocialMediaSitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get business_social_media_sites_index_url
    assert_response :success
  end

  test "should get new" do
    get business_social_media_sites_new_url
    assert_response :success
  end

  test "should get edit" do
    get business_social_media_sites_edit_url
    assert_response :success
  end
end

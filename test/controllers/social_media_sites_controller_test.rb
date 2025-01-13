require "test_helper"

class SocialMediaSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social_media_site = social_media_sites(:one)
  end

  test "should get index" do
    get social_media_sites_url
    assert_response :success
  end

  test "should get new" do
    get new_social_media_site_url
    assert_response :success
  end

  test "should create social_media_site" do
    assert_difference("SocialMediaSite.count") do
      post social_media_sites_url, params: { social_media_site: { name: @social_media_site.name } }
    end

    assert_redirected_to social_media_site_url(SocialMediaSite.last)
  end

  test "should show social_media_site" do
    get social_media_site_url(@social_media_site)
    assert_response :success
  end

  test "should get edit" do
    get edit_social_media_site_url(@social_media_site)
    assert_response :success
  end

  test "should update social_media_site" do
    patch social_media_site_url(@social_media_site), params: { social_media_site: { name: @social_media_site.name } }
    assert_redirected_to social_media_site_url(@social_media_site)
  end

  test "should destroy social_media_site" do
    assert_difference("SocialMediaSite.count", -1) do
      delete social_media_site_url(@social_media_site)
    end

    assert_redirected_to social_media_sites_url
  end
end

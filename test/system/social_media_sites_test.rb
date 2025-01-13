require "application_system_test_case"

class SocialMediaSitesTest < ApplicationSystemTestCase
  setup do
    @social_media_site = social_media_sites(:one)
  end

  test "visiting the index" do
    visit social_media_sites_url
    assert_selector "h1", text: "Social media sites"
  end

  test "should create social media site" do
    visit social_media_sites_url
    click_on "New social media site"

    fill_in "Name", with: @social_media_site.name
    click_on "Create Social media site"

    assert_text "Social media site was successfully created"
    click_on "Back"
  end

  test "should update Social media site" do
    visit social_media_site_url(@social_media_site)
    click_on "Edit this social media site", match: :first

    fill_in "Name", with: @social_media_site.name
    click_on "Update Social media site"

    assert_text "Social media site was successfully updated"
    click_on "Back"
  end

  test "should destroy Social media site" do
    visit social_media_site_url(@social_media_site)
    click_on "Destroy this social media site", match: :first

    assert_text "Social media site was successfully destroyed"
  end
end

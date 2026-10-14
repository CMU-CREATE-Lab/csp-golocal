require "test_helper"

class BusinessSocialMediaSiteTest < ActiveSupport::TestCase
  def build_link(url)
    BusinessSocialMediaSite.new(business: businesses(:one), social_media_site: social_media_sites(:one), url: url)
  end

  test "accepts http and https URLs" do
    assert build_link("https://instagram.com/golocal").valid?
    assert build_link("http://example.com").valid?
  end

  test "rejects invalid URLs" do
    [ "", "instagram.com/golocal", "ftp://example.com", "https://has spaces.com" ].each do |url|
      link = build_link(url)
      assert_not link.valid?, "expected #{url.inspect} to be invalid"
      assert_includes link.errors[:url], "must be a valid URL"
    end
  end

  test "requires a business and a social media site" do
    link = BusinessSocialMediaSite.new(url: "https://example.com")
    assert_not link.valid?
    assert link.errors[:business].any?
    assert link.errors[:social_media_site].any?
  end
end

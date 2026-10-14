require "test_helper"

class SocialMediaSiteTest < ActiveSupport::TestCase
  test "requires a name" do
    site = SocialMediaSite.new(name: "")
    assert_not site.valid?
    assert_includes site.errors[:name], "can't be blank"
  end
end

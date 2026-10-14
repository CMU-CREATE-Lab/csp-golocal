require "test_helper"

class BusinessTest < ActiveSupport::TestCase
  setup do
    @business = businesses(:one)
  end

  test "accepts a PNG logo" do
    @business.logo.attach(io: file_fixture("logo.png").open, filename: "logo.png", content_type: "image/png")
    assert @business.valid?
  end

  test "rejects a logo that is not PNG or JPEG" do
    @business.logo.attach(io: file_fixture("sample.txt").open, filename: "logo.txt", content_type: "text/plain")
    assert_not @business.valid?
    assert @business.errors[:logo].any?
  end

  test "rejects a featured image that is not PNG or JPEG" do
    @business.featured_image.attach(io: file_fixture("sample.txt").open, filename: "image.txt", content_type: "text/plain")
    assert_not @business.valid?
    assert @business.errors[:featured_image].any?
  end

  test "rejects gallery images that are not PNG or JPEG" do
    @business.gallery.attach(io: file_fixture("sample.txt").open, filename: "photo.txt", content_type: "text/plain")
    assert_not @business.valid?
    assert @business.errors[:gallery].any?
  end
end

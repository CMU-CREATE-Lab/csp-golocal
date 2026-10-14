require "test_helper"

# The public links to uploaded files work without logging in.
class ManagedFileLinksTest < ActionDispatch::IntegrationTest
  setup do
    @managed_file = managed_files(:one)
    @managed_file.file.attach(fixture_file_upload("sample.txt", "text/plain"))
  end

  test "filename link redirects to the file" do
    get "/managed_files/filename/#{@managed_file.name}"
    assert_response :redirect
    assert_match "/rails/active_storage/blobs/", response.location
  end

  test "stream link serves the file inline" do
    get @managed_file.streamed_filename_path
    assert_response :success
    assert_equal "text/plain", response.media_type
    assert_match "inline", response.headers["Content-Disposition"]
    assert_equal file_fixture("sample.txt").read, response.body
  end

  test "stream link handles names with spaces" do
    @managed_file.update!(name: "menu with spaces")
    get @managed_file.streamed_filename_path
    assert_response :success
  end

  test "unknown file name redirects home" do
    get "/managed_files/filename/does-not-exist"
    assert_redirected_to "/"

    get "/managed_files/stream/does-not-exist"
    assert_redirected_to "/"
  end

  test "file without an attachment redirects home" do
    get "/managed_files/stream/#{managed_files(:two).name}"
    assert_redirected_to "/"
  end
end

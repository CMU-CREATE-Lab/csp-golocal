require "test_helper"

# Every admin page should send logged-out visitors to the login page,
# and load for a logged-in user.
class AdminAccessTest < ActionDispatch::IntegrationTest
  setup do
    @business = businesses(:one)
    @managed_file = managed_files(:one)
    @news_post = news_posts(:one)

    # Real managed files always have an upload (the model requires one), and the admin list expects it
    ManagedFile.find_each do |managed_file|
      managed_file.file.attach(fixture_file_upload("sample.txt", "text/plain"))
    end
  end

  def admin_paths
    [
      admin_index_path,
      admin_businesses_path,
      new_admin_business_path,
      edit_admin_business_path(@business),
      admin_edit_business_gallery_path(@business),
      admin_business_business_social_media_sites_path(@business),
      new_admin_business_business_social_media_site_path(@business),
      admin_files_path,
      new_admin_file_path,
      edit_admin_file_path(@managed_file),
      admin_news_index_path,
      new_admin_news_path,
      edit_admin_news_path(@news_post),
    ]
  end

  test "admin pages redirect to login when logged out" do
    admin_paths.each do |path|
      get path
      assert_redirected_to "/user/login", "expected #{path} to redirect to login"
    end
  end

  test "admin pages load when logged in" do
    log_in_as(users(:one))

    admin_paths.each do |path|
      get path
      assert_response :success, "expected #{path} to load"
    end
  end

  test "admin cannot create a business when logged out" do
    assert_no_difference("Business.count") do
      post admin_businesses_path, params: { business: { name: "Sneaky Business" } }
    end
    assert_redirected_to "/user/login"
  end

  test "admin cannot delete a news post when logged out" do
    assert_no_difference("NewsPost.count") do
      delete admin_news_path(@news_post)
    end
    assert_redirected_to "/user/login"
  end
end

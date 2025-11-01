require "test_helper"

class ManagedFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @managed_file = managed_files(:one)
  end

  test "should get index" do
    get managed_files_url
    assert_response :success
  end

  test "should get new" do
    get new_managed_file_url
    assert_response :success
  end

  test "should create managed_file" do
    assert_difference("ManagedFile.count") do
      post managed_files_url, params: { managed_file: { name: @managed_file.name } }
    end

    assert_redirected_to managed_file_url(ManagedFile.last)
  end

  test "should show managed_file" do
    get managed_file_url(@managed_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_managed_file_url(@managed_file)
    assert_response :success
  end

  test "should update managed_file" do
    patch managed_file_url(@managed_file), params: { managed_file: { name: @managed_file.name } }
    assert_redirected_to managed_file_url(@managed_file)
  end

  test "should destroy managed_file" do
    assert_difference("ManagedFile.count", -1) do
      delete managed_file_url(@managed_file)
    end

    assert_redirected_to managed_files_url
  end
end

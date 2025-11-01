require "application_system_test_case"

class ManagedFilesTest < ApplicationSystemTestCase
  setup do
    @managed_file = managed_files(:one)
  end

  test "visiting the index" do
    visit managed_files_url
    assert_selector "h1", text: "Managed files"
  end

  test "should create managed file" do
    visit managed_files_url
    click_on "New managed file"

    fill_in "Name", with: @managed_file.name
    click_on "Create Managed file"

    assert_text "Managed file was successfully created"
    click_on "Back"
  end

  test "should update Managed file" do
    visit managed_file_url(@managed_file)
    click_on "Edit this managed file", match: :first

    fill_in "Name", with: @managed_file.name
    click_on "Update Managed file"

    assert_text "Managed file was successfully updated"
    click_on "Back"
  end

  test "should destroy Managed file" do
    visit managed_file_url(@managed_file)
    click_on "Destroy this managed file", match: :first

    assert_text "Managed file was successfully destroyed"
  end
end

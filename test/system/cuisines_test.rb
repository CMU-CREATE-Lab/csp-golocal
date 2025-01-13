require "application_system_test_case"

class CuisinesTest < ApplicationSystemTestCase
  setup do
    @cuisine = cuisines(:one)
  end

  test "visiting the index" do
    visit cuisines_url
    assert_selector "h1", text: "Cuisines"
  end

  test "should create cuisine" do
    visit cuisines_url
    click_on "New cuisine"

    fill_in "Name", with: @cuisine.name
    fill_in "Parent cuisine", with: @cuisine.parent_cuisine_id
    click_on "Create Cuisine"

    assert_text "Cuisine was successfully created"
    click_on "Back"
  end

  test "should update Cuisine" do
    visit cuisine_url(@cuisine)
    click_on "Edit this cuisine", match: :first

    fill_in "Name", with: @cuisine.name
    fill_in "Parent cuisine", with: @cuisine.parent_cuisine_id
    click_on "Update Cuisine"

    assert_text "Cuisine was successfully updated"
    click_on "Back"
  end

  test "should destroy Cuisine" do
    visit cuisine_url(@cuisine)
    click_on "Destroy this cuisine", match: :first

    assert_text "Cuisine was successfully destroyed"
  end
end

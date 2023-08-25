require "application_system_test_case"

class TempBusinessesTest < ApplicationSystemTestCase
  setup do
    @temp_business = temp_businesses(:one)
  end

  test "visiting the index" do
    visit temp_businesses_url
    assert_selector "h1", text: "Temp businesses"
  end

  test "should create temp business" do
    visit temp_businesses_url
    click_on "New temp business"

    check "Accepts credit cards" if @temp_business.accepts_credit_cards
    fill_in "Address", with: @temp_business.address
    fill_in "Business hours", with: @temp_business.business_hours
    fill_in "Catering hours", with: @temp_business.catering_hours
    fill_in "Contact email", with: @temp_business.contact_email
    fill_in "Contact name description", with: @temp_business.contact_name_description
    fill_in "Contact phone", with: @temp_business.contact_phone
    check "Gluten free options" if @temp_business.gluten_free_options
    fill_in "Keywords", with: @temp_business.keywords
    fill_in "Menu link", with: @temp_business.menu_link
    fill_in "Name", with: @temp_business.name
    check "Offers catering" if @temp_business.offers_catering
    check "Offers delivery" if @temp_business.offers_delivery
    check "Vegan options" if @temp_business.vegan_options
    check "Vegetarian options" if @temp_business.vegetarian_options
    fill_in "Website link", with: @temp_business.website_link
    click_on "Create Temp business"

    assert_text "Temp business was successfully created"
    click_on "Back"
  end

  test "should update Temp business" do
    visit temp_business_url(@temp_business)
    click_on "Edit this temp business", match: :first

    check "Accepts credit cards" if @temp_business.accepts_credit_cards
    fill_in "Address", with: @temp_business.address
    fill_in "Business hours", with: @temp_business.business_hours
    fill_in "Catering hours", with: @temp_business.catering_hours
    fill_in "Contact email", with: @temp_business.contact_email
    fill_in "Contact name description", with: @temp_business.contact_name_description
    fill_in "Contact phone", with: @temp_business.contact_phone
    check "Gluten free options" if @temp_business.gluten_free_options
    fill_in "Keywords", with: @temp_business.keywords
    fill_in "Menu link", with: @temp_business.menu_link
    fill_in "Name", with: @temp_business.name
    check "Offers catering" if @temp_business.offers_catering
    check "Offers delivery" if @temp_business.offers_delivery
    check "Vegan options" if @temp_business.vegan_options
    check "Vegetarian options" if @temp_business.vegetarian_options
    fill_in "Website link", with: @temp_business.website_link
    click_on "Update Temp business"

    assert_text "Temp business was successfully updated"
    click_on "Back"
  end

  test "should destroy Temp business" do
    visit temp_business_url(@temp_business)
    click_on "Destroy this temp business", match: :first

    assert_text "Temp business was successfully destroyed"
  end
end

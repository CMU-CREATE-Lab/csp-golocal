require "test_helper"

class TempBusinessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temp_business = temp_businesses(:one)
  end

  test "should get index" do
    get temp_businesses_url
    assert_response :success
  end

  test "should get new" do
    get new_temp_business_url
    assert_response :success
  end

  test "should create temp_business" do
    assert_difference("TempBusiness.count") do
      post temp_businesses_url, params: { temp_business: { accepts_credit_cards: @temp_business.accepts_credit_cards, address: @temp_business.address, business_hours: @temp_business.business_hours, catering_hours: @temp_business.catering_hours, contact_email: @temp_business.contact_email, contact_name_description: @temp_business.contact_name_description, contact_phone: @temp_business.contact_phone, gluten_free_options: @temp_business.gluten_free_options, keywords: @temp_business.keywords, menu_link: @temp_business.menu_link, name: @temp_business.name, offers_catering: @temp_business.offers_catering, offers_delivery: @temp_business.offers_delivery, vegan_options: @temp_business.vegan_options, vegetarian_options: @temp_business.vegetarian_options, website_link: @temp_business.website_link } }
    end

    assert_redirected_to temp_business_url(TempBusiness.last)
  end

  test "should show temp_business" do
    get temp_business_url(@temp_business)
    assert_response :success
  end

  test "should get edit" do
    get edit_temp_business_url(@temp_business)
    assert_response :success
  end

  test "should update temp_business" do
    patch temp_business_url(@temp_business), params: { temp_business: { accepts_credit_cards: @temp_business.accepts_credit_cards, address: @temp_business.address, business_hours: @temp_business.business_hours, catering_hours: @temp_business.catering_hours, contact_email: @temp_business.contact_email, contact_name_description: @temp_business.contact_name_description, contact_phone: @temp_business.contact_phone, gluten_free_options: @temp_business.gluten_free_options, keywords: @temp_business.keywords, menu_link: @temp_business.menu_link, name: @temp_business.name, offers_catering: @temp_business.offers_catering, offers_delivery: @temp_business.offers_delivery, vegan_options: @temp_business.vegan_options, vegetarian_options: @temp_business.vegetarian_options, website_link: @temp_business.website_link } }
    assert_redirected_to temp_business_url(@temp_business)
  end

  test "should destroy temp_business" do
    assert_difference("TempBusiness.count", -1) do
      delete temp_business_url(@temp_business)
    end

    assert_redirected_to temp_businesses_url
  end
end

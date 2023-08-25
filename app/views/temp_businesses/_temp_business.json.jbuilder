json.extract! temp_business, :id, :name, :logo, :gallery, :business_hours, :catering_hours, :address, :website_link, :contact_name_description, :contact_email, :contact_phone, :keywords, :menu_link, :offers_delivery, :offers_catering, :accepts_credit_cards, :vegetarian_options, :vegan_options, :gluten_free_options, :created_at, :updated_at
json.url temp_business_url(temp_business, format: :json)
json.logo url_for(temp_business.logo)
json.gallery do
  json.array!(temp_business.gallery) do |gallery|
    json.id gallery.id
    json.url url_for(gallery)
  end
end

class CreateTempBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :temp_businesses do |t|
      t.string :name
      t.text :business_hours
      t.text :catering_hours
      t.string :address
      t.string :website_link
      t.text :contact_name_description
      t.string :contact_email
      t.string :contact_phone
      t.text :keywords
      t.string :menu_link
      t.boolean :offers_delivery
      t.boolean :offers_catering
      t.boolean :accepts_credit_cards
      t.boolean :vegetarian_options
      t.boolean :vegan_options
      t.boolean :gluten_free_options

      t.timestamps
    end
  end
end

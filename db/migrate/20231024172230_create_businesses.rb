class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.text :business_hours
      t.text :catering_hours
      t.string :address
      t.string :website_link
      t.text :contact_name_description
      t.string :contact_email
      t.string :contact_phone
      t.string :menu_link
      t.boolean :offers_delivery
      t.boolean :offers_catering
      t.boolean :vegetarian_options
      t.boolean :vegan_options
      t.boolean :gluten_free_options
      t.boolean :handles_tax_exemption
      t.boolean :handles_small_cater_size
      t.boolean :handles_medium_cater_size
      t.boolean :handles_large_cater_size
      t.boolean :handles_xlarge_cater_size
      t.text :small_cater_size_lead_time
      t.text :medium_cater_size_lead_time
      t.text :large_cater_size_lead_time
      t.text :xlarge_cater_size_lead_time
      t.boolean :cater_drop_off
      t.boolean :cater_setup
      t.boolean :cater_full_service
      t.boolean :is_published

      t.timestamps
    end
  end
end

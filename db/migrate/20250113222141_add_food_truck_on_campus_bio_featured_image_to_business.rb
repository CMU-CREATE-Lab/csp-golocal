class AddFoodTruckOnCampusBioFeaturedImageToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :is_food_truck, :boolean
    add_column :businesses, :is_on_campus, :boolean
    add_column :businesses, :bio, :text
    add_column :businesses, :featured_image, :string
  end
end

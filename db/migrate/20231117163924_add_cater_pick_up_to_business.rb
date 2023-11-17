class AddCaterPickUpToBusiness < ActiveRecord::Migration[7.0]
  def change
      add_column :businesses, :cater_pick_up, :boolean
  end
end

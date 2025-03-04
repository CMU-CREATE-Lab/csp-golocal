class AddPhdcToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :is_phdc, :boolean
  end
end

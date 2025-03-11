class AddHalalToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :halal_options, :boolean
  end
end

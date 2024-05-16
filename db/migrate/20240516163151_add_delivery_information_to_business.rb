class AddDeliveryInformationToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :delivery_information, :text
  end
end

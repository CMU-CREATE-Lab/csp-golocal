class AddParentCuisineTypeToCuisines < ActiveRecord::Migration[7.0]
  def change
    add_reference :cuisines, :parent_cuisine, foreign_key: { to_table: :cuisines }
  end
end

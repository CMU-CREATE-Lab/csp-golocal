class CreateCuisines < ActiveRecord::Migration[7.0]
  def change
    create_table :cuisines do |t|
      t.string :name
      ## NOTE: this gets added in another migration (for foreign key reference)
      #t.integer :parent_cuisine_id

      t.timestamps
    end
  end
end

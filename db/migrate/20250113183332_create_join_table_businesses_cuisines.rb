class CreateJoinTableBusinessesCuisines < ActiveRecord::Migration[7.0]
  def change
    create_join_table :businesses, :cuisines do |t|
      # t.index [:business_id, :cuisine_id]
      # t.index [:cuisine_id, :business_id]
    end
  end
end

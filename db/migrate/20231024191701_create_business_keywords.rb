class CreateBusinessKeywords < ActiveRecord::Migration[7.0]
  def change
    create_join_table :businesses, :keywords do |t|
      t.index :business_id
      t.index :keyword_id
    end
  end
end

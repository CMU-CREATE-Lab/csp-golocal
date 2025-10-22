class CreateNewsPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :news_posts do |t|
      t.string :title
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end

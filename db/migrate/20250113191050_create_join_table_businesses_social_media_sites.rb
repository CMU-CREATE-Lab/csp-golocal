class CreateJoinTableBusinessesSocialMediaSites < ActiveRecord::Migration[7.0]
  def change
    create_table :business_social_media_sites do |t|
      t.references :business, null: false, foreign_key: true
      t.references :social_media_site, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end

class CreateManagedFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :managed_files do |t|
      t.string :name

      t.timestamps
    end
    add_index :managed_files, :name, unique: true
  end
end

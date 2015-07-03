class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :image
      t.integer :total

      t.timestamps null: false
    end
    add_index :categories, :name, unique: true
  end
end

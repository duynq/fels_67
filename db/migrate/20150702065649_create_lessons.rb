class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.integer :point
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :lessons, :name, unique: true
    add_index :lessons, [:user_id, :category_id, :created_at]
  end
end

class RemoveColumnCategory < ActiveRecord::Migration
  def change
  	remove_column :categories, :total
  end
end

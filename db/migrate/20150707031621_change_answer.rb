class ChangeAnswer < ActiveRecord::Migration
  def change
    remove_column :answers, :answer_id
    rename_column :answers, :answer, :status
    add_column :answers, :content, :string
    add_column :answers, :word_id, :integer, references: :words
    add_index :answers, :word_id
    add_index :answers, :status
  end
end

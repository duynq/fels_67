class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :answer_id

      t.timestamps null: false
    end
    add_index :answers, :question_id
    add_index :answers, :answer_id
    add_index :answers, [:question_id, :answer_id], unique: true
  end
end

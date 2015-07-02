class ChangeColumnWord < ActiveRecord::Migration
  def change
  	remove_column :answers, :question_id, :answer_id
  	add_column :answers, :answer, :boolean
  end
end

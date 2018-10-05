class CreatePossibleAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :possible_answers do |t|
      t.integer :prompt_question_id
      t.integer :next_question_id
      t.string :choice

      t.timestamps
    end
  end
end

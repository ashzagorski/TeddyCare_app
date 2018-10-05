class CreateDocumentedAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :documented_answers do |t|
      t.integer :visit_id
      t.integer :possible_answer_id

      t.timestamps
    end
  end
end

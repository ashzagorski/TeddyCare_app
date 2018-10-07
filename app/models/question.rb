class Question < ApplicationRecord
  has_many :possible_answers, foreign_key: "prompt_question_id"

  validates :prompt, presence: true

  def documented_answer
    if question.possible_answer.choice == "Yes"
      documented_answer.possible_answer_id = question.possible_answer.choice.id
      


end

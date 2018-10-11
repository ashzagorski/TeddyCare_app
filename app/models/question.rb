class Question < ApplicationRecord
  has_many :possible_answers, foreign_key: "prompt_question_id"

  validates :prompt, presence: true
   


end

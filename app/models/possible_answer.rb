class PossibleAnswer < ApplicationRecord
  has_many :documented_answers
  belongs_to :prompt_question, class_name: "Question"
  belongs_to :next_question, class_name: "Question"

  validates :choice, presence: true
end

class DocumentedAnswer < ApplicationRecord
  belongs_to :visit
  belongs_to :possible_answer
  has_one :prompt_question, through: :possible_answer

end

class Question < ApplicationRecord
  belongs_to :possible_answer

  validates :prompt, presence: true
end

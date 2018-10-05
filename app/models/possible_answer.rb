class PossibleAnswer < ApplicationRecord
  has_many :documented_answers
  has_many :questions

  validates :choice, presence: true
end

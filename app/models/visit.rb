class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :healthcare_provider
  has_many :documented_answers

  validates :visit_datetime, presence: true
end

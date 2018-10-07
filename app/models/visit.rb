class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :healthcare_provider
  has_many :documented_answers

  validates :visit_datetime, presence: true

  def friendly_visit_datetime
    visit_datetime.strftime("%A, %B %e %Y, %m %M %p")
  end 

end

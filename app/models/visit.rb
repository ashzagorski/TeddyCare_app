class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :healthcare_provider
  has_many :documented_answers

  validates :visit_datetime, presence: true

  def friendly_visit_datetime
    visit_datetime.strftime("%A, %B %e %Y, %m:%M %p")
  end 
  
  def todays_visit?
    if visit_datetime.strftime("%A, %B %e %Y") == Time.now.strftime("%A, %B %e %Y")
    end
  end
end

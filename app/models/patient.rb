class Patient < ApplicationRecord
  has_many :visits
  has_many :healthcare_providers, through: :visits
  has_many :diagnosis

  validates :name, presence: true
  validates :date_of_birth, presence: true
  validates :address_1, presence: true
  
  def friendly_date_of_birth
      date_of_birth.strftime("%B %e, %Y")
  end 

  
end

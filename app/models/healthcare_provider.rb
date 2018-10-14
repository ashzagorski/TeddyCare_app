class HealthcareProvider < ApplicationRecord
  has_secure_password

  has_many :visits
  has_many :patients, through: :visits


  validates :name, presence: true
  validates :position, presence: true
  validates :employee_number, presence: true
  validates :employee_number, uniqueness: true
  validates :employee_number, length: {minimum: 8}
  validates :employee_number, length: {maximum: 8}


  enum position: {Nurse: 0, Doctor: 1, Surgeon: 2, Therapist: 3}

  
end

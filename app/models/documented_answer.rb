class DocumentedAnswer < ApplicationRecord
  belongs_to :visit
  belongs_to :possible_answer

  def visit_id
    current_visit = current_healthcare_provider.visits.find(params[:id])
    current_visit.id = self.possible_answer_id
  end

  def possible_answer_id
    patient_answer = possible_answer.find(params[:choice])
  end 
end

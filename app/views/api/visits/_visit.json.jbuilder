json.visit_datetime visit.visit_datetime
json.patient_id visit.patient_id
json.patient_name visit.patient.name


json.formatted do
  json.visit_datetime visit.friendly_visit_datetime
end


json.documented_answer do
  json.partial! visit.documented_answers, partial: 'api/documented_answers/documented_answer', as: :documented_answer
end



json.current_healthcare_provider current_healthcare_provider


json.visit_datetime visit.visit_datetime

json.patient do 
  json.id visit.patient.id
  json.name visit.patient.name
  json.date_of_birth visit.patient.date_of_birth
  json.address_1 visit.patient.address_1
  json.address_2 visit.patient.address_2
  json.city visit.patient.city
  json.state visit.patient.state
  json.zip_code visit.patient.zip_code
  json.medication visit.patient.medication
end

json.formatted do
  json.visit_datetime visit.friendly_visit_datetime
end

json.documented_answers do
  json.array! visit.documented_answers, partial: 'api/documented_answers/documented_answer', as: :documented_answer
end


json.visit_datetime visit.visit_datetime
json.patient_id visit.patient_id

json.formatted do
  json.visit_datetime visit.friendly_visit_datetime
end
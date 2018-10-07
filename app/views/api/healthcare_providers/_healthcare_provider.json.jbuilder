json.name healthcare_provider.name
json.position healthcare_provider.position
json.employee_number healthcare_provider.employee_number


json.visit do
  json.array! healthcare_provider.visits, partial: 'api/visits/visit', as: :visit
end 


json.patient do 
  json.array! healthcare_provider.patients, partial: 'api/patients/patient', as: :patient
end
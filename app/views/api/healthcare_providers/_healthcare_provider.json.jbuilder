json.id healthcare_provider.id
json.name healthcare_provider.name
json.position healthcare_provider.position
json.employee_number healthcare_provider.employee_number

json.visits do
  json.array! healthcare_provider.visits, partial: 'api/visits/visit', as: :visit
end

json.todays_visits do
  json.array! healthcare_provider.todays_visits, partial: 'api/visits/visit', as: :visit
end 

json.patients do 
  json.array! healthcare_provider.patients.each do |patient|
    json.id patient.id
    json.name patient.name
    json.date_of_birth patient.date_of_birth
    json.address_1 patient.address_1
    json.address_2 patient.address_2
    json.city patient.city
    json.state patient.state
    json.zip_code patient.zip_code
    json.medication patient.medication
  end
end


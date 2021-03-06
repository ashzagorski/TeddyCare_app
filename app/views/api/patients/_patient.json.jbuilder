json.id patient.id
json.name patient.name
json.date_of_birth patient.date_of_birth
json.address_1 patient.address_1
json.address_2 patient.address_2
json.city patient.city
json.state patient.state
json.zip_code patient.zip_code
json.medication patient.medication
json.image patient.image

json.formatted do
  json.date_of_birth patient.friendly_date_of_birth
end


json.visit do 
  json.array! patient.visits, partial: 'api/visits/visit', as: :visit
end

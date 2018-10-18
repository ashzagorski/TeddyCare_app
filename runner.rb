require 'http'

######-------############-------############-------######
# Starting a New Visit
######-------############-------############-------######

puts "Please enter I.D. to begin session"

healthcare_providers_id = gets.chomp.to_i

response_1 = HTTP.get("http://localhost:3000/api/healthcare_providers/#{healthcare_providers_id}")
puts response_1.parse["visit"]

puts "Choose visit I.D. you would like to begin."

visit_id = gets.chomp.to_i

response_2 = HTTP.get("http://localhost:3000/api/visits/#{visit_id}")

patient_id = response_2.parse["patient_id"]

patient_page = HTTP.get("http://localhost:3000/api/patients/#{patient_id}") 

puts patient_page.parse

######-------############-------############-------######
# Completing Pain Form
######-------############-------############-------######

puts "Would you like to begin pain assessment, yes or no?"
  answer = gets.chomp

if answer == "yes"

  response_3 = HTTP.get("http://localhost:3000/api/questions/1")

  p response_3.parse["prompt"]

  p response_3.parse["possible_answer"][0]["choice"] + " or " + response_3.parse["possible_answer"][1]["choice"]
     choice = gets.chomp
   
      

 

  if choice.downcase == "yes"
    possible_answer_id = 1

    params = {
            visit_id: visit_id,
            possible_answer_id: possible_answer_id
            }
    HTTP.post("http://localhost:3000/api/documented_answers", 
              form: params)

    question_1 = response_3.parse["possible_answer"][0]["next_question_id"] 
    response_4 = HTTP.get("http://localhost:3000/api/questions/#{question_1}")
    p response_4.parse["prompt"]

    p response_4.parse["possible_answer"][0]["choice"] + " or " + response_4.parse["possible_answer"][1]["choice"]

    pain_location = gets.chomp

    HTTP.post("http://localhost:3000/api/documented_answers", form: {visit_id: visit_id, possible_answer_id: 2})

######-------############-------############-------######
# Displaying Patient page with answers from Pain form
######-------############-------############-------######


    p patient_page.parse 
    p choice 
    p pain_location
  

  else
    p patient_page.parse
  end 
  
else
  puts patient_page.parse

end 







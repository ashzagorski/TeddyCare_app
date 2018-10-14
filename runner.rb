require 'http'

response_1 = HTTP.get("http://localhost:3000/api/healthcare_providers/2")

puts "Choose visit I.D. you would like to begin."

visit_id = gets.chomp.to_i

response_2 = HTTP.get("http://localhost:3000/api/visits/#{visit_id}")

puts "Which type of questions would you like to ask?"

dialogue = gets.chomp.to_i

response_3 = HTTP.get("http://localhost:3000/api/questions/#{dialogue}")

p response_3.parse["prompt"]

p response_3.parse["possible_answer"][0]["choice"] + " or " + response_3.parse["possible_answer"][1]["choice"]

HTTP.post("http://localhost:3000/api/documented_answers/1", form: {visit_id: visit_id, possible_answer_id: 1})

choice = gets.chomp


dialogue = response_3.parse["possible_answer"][0]["next_question_id"] 


response_4 = HTTP.get("http://localhost:3000/api/questions/#{dialogue}")
p response_4.parse["prompt"]

p response_4.parse["possible_answer"][0]["choice"] + " or " + response_4.parse["possible_answer"][1]["choice"]

pain_location = gets.chomp

HTTP.post("http://localhost:3000/api/documented_answers/2", form: {visit_id: visit_id, possible_answer_id: 2})


response_5 = HTTP.get("http://localhost:3000/api/documented_answers")

p response_5.parse
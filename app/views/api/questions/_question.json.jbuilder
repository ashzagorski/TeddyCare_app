json.prompt question.prompt

json.possible_answer do 
  json.array! possible_answer, partial: 'api/possible_answers/possible_answer', as: :possible_answer
end
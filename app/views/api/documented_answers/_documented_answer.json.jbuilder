json.visit_id documented_answer.visit_id
json.possible_answer_id documented_answer.possible_answer_id

json.possible_answer do
  json.partial! documented_answer.possible_answer, partial: 'api/possible_answers/possible_answer', as: :possible_answer
end
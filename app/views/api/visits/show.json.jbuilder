json.partial! @visit, partial: 'visit', as: :visit

json.visit.documented_answers.includes(:possible_answer, :prompt_question)

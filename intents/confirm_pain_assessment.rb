require './lib/name'
require 'active_support/core_ext/array/conversions'

intent "ConfirmPainAssessment" do
  response = request.session_attribute('response')
  part = request.session_attribute('part')
  length = request.session_attribute("length")
  rate = request.slot_value("rate")
  visit_id = request.session_attribute("visit_id")

  if response == "yes" 
    card_title = "Danny does have pain."
  else 
    card_title = "Danny has no pain."
  end

  card_body = "Danny has pain in her #{ part} for #{length} with a rating of #{rate}"

  if response == "yes" 
    response = 1
  else 
    response = 2
  end

  if part == 'head'
    part = 3
  elsif part == 'back'
    part = 4
  elsif part == 'stomach' 
    part = 5
  elsif part == 'arm' 
    part = 13
  else part == 'leg'
    part = 14
  end

  if length == 'today'
    length = 6
  elsif length == 'a week ago' 
    length = 7
  elsif length == 'a month ago'
    length = 15
  elsif length == 'six months ago' 
    length = 16
  elsif length == 'one year ago'
    length = 18 
  else length == 'over one year'
    length = 17
      
  end 

  if rate == '1' 
    rate = 8
  elsif rate == '2' 
    rate = 9
  elsif rate == '3' 
    rate = 10
  elsif rate == '4'
    rate = 11
  else rate == '5' 
    rate = 12
  end
      
      
      


  @documented_answer = DocumentedAnswer.new(possible_answer_id: response, visit_id: visit_id.to_i)
  @documented_answer.save
    answer = @documented_answer.possible_answer
    next_question_id = answer.next_question_id

  @documented_answer = DocumentedAnswer.new(possible_answer_id: part, visit_id: visit_id.to_i)
  @documented_answer.save
    answer = @documented_answer.possible_answer
    next_question_id = answer.next_question_id

  @documented_answer = DocumentedAnswer.new(possible_answer_id: length, visit_id: visit_id.to_i)
  @documented_answer.save
    answer = @documented_answer.possible_answer
    next_question_id = answer.next_question_id

  @documented_answer = DocumentedAnswer.new(possible_answer_id: rate, visit_id: visit_id.to_i)

  @documented_answer.save
    answer = @documented_answer.possible_answer
    next_question_id = answer.next_question_id
      
      
  assessment_card = card(card_title, card_body)

  tell("<speak><voice name='Ivy'> <prosody pitch='high'>It was great talking with you #{ Name::NAME}! If you need anything else don't hesitate to ask. We will do everything we can to help reduce your pain.</prosody></voice></speak>", ssml: true, card: assessment_card)
end
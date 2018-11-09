intent "ConfirmPainAssessment" do
  response = request.session_attribute('response')
  part = request.session_attribute('part')
  length = request.session_attribute("length")
  rate = request.slot_value("rate")
  visit_id = request.session_attribute("visit_id")

  if response == "yes"
    card_title = "Sally does have pain."
  else 
    card_title = "Sally has no pain."
  end
  card_body = "Sally has pain in her #{ part} for #{length} with a rating of #{rate}"

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
  end

  if length == 'today'
    length = 6
  elsif length == 'week'
    length = 7
  end 

  if rate == "one"
    rate = 8
  elsif rate == "two"
    rate = 9
  elsif rate == "three"
    rate = 10
  elsif rate == "four"
    rate = 11
  else rate == "five"
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

  tell("<speak><voice name='Justin'>It was great talking with you Sally! If you need anything else don't hesitate to ask We will do everything we can to help reduce your pain.</voice></speak>", ssml: true, card: assessment_card)
end
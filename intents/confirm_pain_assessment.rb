intent "ConfirmPainAssessment" do
  response = request.session_attribute('response')
  part = request.session_attribute('part')
  length = request.session_attribute("length")
  rate = request.slot_value("rate")
  visit_id = request.session_attribute("visit_id")

  if response == "yes" || "mhmmm" || "yeah" || "yay"
    card_title = "Danny does have pain."
  else 
    card_title = "Danny has no pain."
  end
  card_body = "Danny has pain in her #{ part} for #{length} with a rating of #{rate}"

  if response == "yes" || "mhmmm" || "yeah" || "yay"
    response = 1
  else 
    response = 2
  end

  if part == "head" || "forehead"
    part = 3
  elsif part == "back"
    part = 4
  elsif part == 'stomach' || 'belly'
    part = 5
  elsif part == 'arm' || 'hand' || 'elbow' || 'shoulder'
    part = 13
  else part == 'leg' || 'knee' || 'foot' || 'hip'
    part = 14
  end

  if length == 'today'
    length = 6
  elsif length == 'a week or less' || 'one week' || 'yesterday'
    length = 7
  elsif length == 'a month or less' || 'month' || 'last week'
    length = 15
  elsif length == 'six months or less' || 'a few months'
    length = 16
  elsif length == 'one year or less' || 'a year' || 'one year'
    length = 18 
  else length == 'over one year'
    length = 17
      
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

  tell("<speak><voice name='Ivy'> <prosody pitch='high'>It was great talking with you Sally! If you need anything else don't hesitate to ask We will do everything we can to help reduce your pain.</prosody></voice></speak>", ssml: true, card: assessment_card)
end
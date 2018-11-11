intent "RatePainAssessment" do 
  response = request.session_attribute('response')
  part = request.session_attribute('part')
  length = request.slot_value("length")
  visit_id = request.session_attribute('visit_id')


  ask("<speak><voice name='Ivy'> <prosody pitch='high'> We do not want you to feel any pain, ever. I want to find out how bad your pain hurts. We are going to use numbers to to determine how bad our pain is. We can give our pain a one, two, three, four, or five. If it's really, really painful we are going to give it a five and if its just a little pain, like a pinch, we will give it a one. How would you rate your pain giving it a one, two, three, four, or five? </prosody></voice> </speak>", ssml: true, session_attributes: {visit_id: visit_id, length: length, part: part, response: response } )
end
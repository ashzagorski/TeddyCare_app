intent "OngoingPainAssessment" do 
  response = request.session_attribute('response')
  part = request.slot_value("part")

  ask("<speak><voice name='Justin'> O, No!! Pain in your #{ part } is no fun. We want to help you with that. How long have you been having this pain? Did it start today or a week, month, year or years ago? </voice></speak>", ssml: true,  session_attributes: { part: part, response: response } )
end
intent "OngoingPainAssessment" do 
  response = request.session_attribute('response')
  part = request.slot_value("part")
  visit_id = request.session_attribute('visit_id')


  ask("<speak>
    <voice name='Ivy'> <prosody pitch='high'>
    <emphasis level='strong'> O, No!!</emphasis> 
    Pain in your #{ part } is no fun. We want to help you with that. How long have you been having this pain? Did it start today, a week ago or lesso, a month ago or less, six months ago or less, a year ago or less or over a year ago? </prosody></voice></speak>", ssml: true,  session_attributes: { visit_id: visit_id, part: part, response: response } )
end
require './lib/parts'
require './lib/name'
require 'active_support/core_ext/array/conversions'

intent "ContinuePainAssessment" do 
  response = request.slot_value("response")
  visit_id = request.session_attribute('visit_id')


  if response == "yes"
  ask("<speak>
        <voice name='Ivy'> <prosody pitch='high'>I am sorry to hear you are in pain. Can you tell me where your pain is. Do you have pain in your head, back, leg, arm or stomach?</prosody></voice></speak>", ssml: true, session_attributes: { visit_id: visit_id, response: response })
  else 

    @documented_answer = DocumentedAnswer.new(possible_answer_id: 2, visit_id: visit_id.to_i)

     @documented_answer.save
       
    tell("<speak>
        <voice name='Ivy'> <prosody pitch='high'> <emphasis level='strong'> YAY!! </emphasis> Great news #{ Name::NAME } I am happy to hear you have no pain. </prosody></voice></speak>", ssml: true)
  end
end
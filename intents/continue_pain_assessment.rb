require './lib/parts'
require 'active_support/core_ext/array/conversions'

intent "ContinuePainAssessment" do 
  response = request.slot_value("response")
  visit_id = request.session_attribute('visit_id')

  if response == "yes"
  ask("<speak>
        <voice name='Justin'>I am sorry to hear you are in pain. Can you tell me where your pain is. Do you have pain in your head, back, or stomach?</voice></speak>", ssml: true, session_attributes: { visit_id: visit_id, response: response })
  else 
    ask("<speak>
        <voice name='Justin'>Yay! Great news Sally. I am happy to hear you have no pain.</voice></speak>", ssml: true, session_attributes: { visit_id: visit_id,response: response})
  end
end
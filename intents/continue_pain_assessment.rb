require './lib/parts'
require 'active_support/core_ext/array/conversions'

intent "ContinuePainAssessment" do 
  response = request.slot_value("response")

  if response == "yes"
  ask("<speak>
        <voice name='Justin'>I am sorry to hear you are in pain. Can you tell me where your pain is. Do you have pain in your #{ BodyParts::PARTS.to_sentence }?</voice></speak>", ssml: true, session_attributes: { response: response })
  else 
    ask("<speak>
        <voice name='Justin'>Yay! Great news Sally. I am happy to hear you have no pain.</voice></speak>", ssml: true, session_attributes: { response: response})
  end
end
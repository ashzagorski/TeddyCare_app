intent "ConfirmPainAssessment" do
  response = request.session_attribute('response')
  part = request.session_attribute('part')
  length = request.session_attribute("length")
  rate = request.session_attribute("rate") 

  
  if response == "yes"
    card_title = "Sally does have pain."
  else 
    card_title = "Sally has no pain."
  end
  card_body = "Sally has pain in her #{ part} for #{length} with a rating of #{rate}"
  # card_image = "https://image.ibb.co/jeRZLv/alexa_pizza.png"
  assessment_card = card(card_title, card_body)

  tell("<speak><voice name='Justin'>It was great talking if you Sally! If you need anything else don't hesitate to ask We will do everything we can to help reduce your pain.</voice></speak>", ssml: true, card: assessment_card)
end
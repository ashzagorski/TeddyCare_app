intent "QuestionOneAssessment" do 
  visit_id = request.slot_value("visit_id")
  
  ask("<speak>
        <voice name='Ivy'> <prosody pitch='high'> Welcome to the children's hospital Danny, we are happy you are here! My name is Echo the Teddy and I am here to help you.  I am going to ask you a few questions today, answer exactly how you are feeling. Here we go!! <break time='2s'/>  Are you in any pain, yes or no?</prosody></voice>
        </speak>", ssml: true, session_attributes: {visit_id: visit_id})
end
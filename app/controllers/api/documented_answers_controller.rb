class Api::DocumentedAnswersController < ApplicationController
  def index
    @documented_answer = current_healthcare_provider.visit.find(params[:id])
  end 

  def create
    
    # question = Question.find(params[:possible_answer])
    # # possible_answers = question.possible_answers

    # # question.possible_answer.choice.id

    @documented_answer = DocumentedAnswer.new
    @documented_answer.visit_id
    @documented_answer.possible_answer_id

    
    if @documented_answer.save
        redirect_to "http://localhost:3000/api/questions/2"
      else no
        render json: {message: "Please Select Possible Answer."}
      end
        
  end 

  def destroy
    @documented_answer = DocumentedAnswer.find(params[:id])
    @documented_answer.update(status: "Deleted")
    render json: {status: "Answer was deleted from form."}
end

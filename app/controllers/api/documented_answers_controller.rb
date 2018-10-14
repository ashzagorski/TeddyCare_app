class Api::DocumentedAnswersController < ApplicationController
  def index
    @documented_answers = DocumentedAnswer.all
    render 'index.json.jbuilder'
  end 

  def create 

    @documented_answer = DocumentedAnswer.new(
                                              visit_id: params[:visit_id],
                                              possible_answer_id: params[:possible_answer_id]
                                              )

    answer = @documented_answer.possible_answer
    next_question = answer.next_question
    
    if @documented_answer.save
        redirect_to "http://localhost:3000/api/questions/#{next_question.id}"
    else 
        render json: {message: "Please Select Possible Answer."}
    end
        
  end 

  def destroy
    @documented_answer = DocumentedAnswer.find(params[:id])
    @documented_answer.update(status: "Deleted")
    render json: {status: "Answer was deleted from form."}
  end
end

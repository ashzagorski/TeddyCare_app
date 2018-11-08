class Api::DocumentedAnswersController < ApplicationController
    before_action :authenticate_healthcare_provider

  def index
    @documented_answers = DocumentedAnswer.all
    render 'index.json.jbuilder'
  end 

  def create 

    @documented_answer = DocumentedAnswer.new(
                                              visit_id: params[:visit_id],
                                              possible_answer_id: params[:possible_answer_id]
                                              )

    
    if @documented_answer.save
      answer = @documented_answer.possible_answer
      next_question_id = answer.next_question_id
      
      render json: {message: "it worked"}
    else 
        render json: {message: "Please Select Possible Answer."}, status: :bad_request
    end
        
  end 

  def show
    @documented_answer = DocumentedAnswer.find(params[:id]
      )
    render 'show.json.jbuilder'
  end 

  def destroy
    @documented_answer = DocumentedAnswer.find(params[:id])
    @documented_answer.update(status: "Deleted")
    render json: {status: "Answer was deleted from form."}
  end
end

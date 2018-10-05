class Api::PossibleAnswersController < ApplicationController
  def create
    @possible_answer = PossibleAnswer.create(
                                              choice: params[:choice],
                                              next_question_id: params[:next_question_id],
                                              prompt_question_id: params[:prompt_question_id]
                                              )
  end
end

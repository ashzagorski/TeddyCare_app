class Api::QuestionsController < ApplicationController
  def create
    @question = Question.create(prompt: params[:prompt])
  end
end

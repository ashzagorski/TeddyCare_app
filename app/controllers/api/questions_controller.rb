class Api::QuestionsController < ApplicationController
  
  def index
    @questions = Questions.all
    render 'index.json.jbuilder'
  end 

  def create
    @question = Question.create(prompt: params[:prompt])
  end

  def show
    @question = Question.find(params[:id])
    render 'show.json.jbuilder'
  end 
end

class Api::QuestionsController < ApplicationController
    before_action :authenticate_healthcare_provider

  def index
    @questions = Question.all
    render 'index.json.jbuilder'
  end 

  def create
    @question = Question.create(prompt: params[:prompt])
  end

  def show
    
     if @question = Question.find(params[:id])
      render 'show.json.jbuilder'
    else
      redirect_to "http://localhost:3000/api/patients/1"
    end
  end 
end

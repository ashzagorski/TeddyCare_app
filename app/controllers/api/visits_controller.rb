class Api::VisitsController < ApplicationController
  before_action :authenticate_healthcare_provider
  
  def index
    @visits = Visit.all
    render 'index.json.jbuilder'
  end

  def create
    @visit = Visit.new(
                      visit_datetime: params[:visit_datetime],
                      healthcare_provider_id: params[:healthcare_provider_id],
                      patient_id: params[:patient_id]
                      )
    if @visit = Visit.save
      render json: {message: 'Visit created successfully'}, status: :created
    else
      render json: [errors: @visit.errors.full_messages], status: :unprocessable_entity
    end
  end

  def show
    @visit = Visit.find(params[:id])
    @patient = Patient.find(@visit.patient_id)
    # @visit.documented_answers.includes(:possible_answer, :prompt_question)


    render 'show.json.jbuilder'
  end 

  def update
    @visit = Visit.find(params[:id])

    @visit.visit_datetime = params[:visit_datetime] || @visit.visit_datetime
    @visit.healthcare_provider_id = params[:healthcare_provider_id] || @visit.healthcare_provider_id
    @visit.patient_id = params[:patient_id] || @visit.patient_id

    if @visit.save
      render 'show.json.jbuilder'
    else
      render json: [errors: @visit.errors.full_messages], status: :unprocessable_entity
    end
  end 

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    render json: {status: "Visit was Cancelled."}
  end 
end

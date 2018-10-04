class Api::PatientsController < ApplicationController
  def index
    @patients = Patient.all
    render 'index.json.jbuilder'
  end 

  def create
    @patient = Patient.new(
                           name: params[:name],
                           date_of_birth: params[:date_of_birth],
                           address_1: params[:address_1],
                           address_2: params[:address_2],
                           city: params[:city],
                           state: params[:state],
                           zip_code: params[:zip_code],
                           medication: params[:medication]
                           )
    if @patient.save
      render 'show.json.jbuilder'
    else 
      render json: {errors: @patient.errors.full_messages}, status: :unprocessable_entity
    end
  end 

  def show
    @patient = Patient.find(params[:id])
    render 'show.json.jbuilder'
  end 

  def update
    @patient = Patient.find(params[:id])

    @patient.name = params[:name] || @patient.name
    @patient.date_of_birth = params[:date_of_birth] || @patient.date_of_birth
    @patient.address_1 = params[:address_1] || @patient.address_1
    @patient.address_2 = params[:address_2] || @patient.address_2
    @patient.city = params[:city] || @patient.city
    @patient.state = params[:state] || @patient.state
    @patient.zip_code = params[:zip_code] || @patient.zip_code
    @patient.medication = params[:medication] || @patient.medication

    if @patient.save
      render 'show.json.jbuilder'
    else 
      render json: {errors: @patient.errors.full_messages}, status: :unprocessable_entity
    end
  end 

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    render json: {message: "Patient successfully destroyed."}
  end 
end

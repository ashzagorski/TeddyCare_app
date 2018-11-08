class Api::HealthcareProvidersController < ApplicationController
  before_action :authenticate_healthcare_provider
  
  def index
    @healthcare_providers = HealthcareProvider.all
    render 'index.json.jbuilder'
  end 

  def create
    @healthcare_provider = HealthcareProvider.new(
                              name: params[:name],
                              position: params[:position],
                              employee_number: params[:employee_number],
                              password: params[:password],
                              password_confirmation: params[:password_confirmation]
                              )
    
     if @healthcare_provider.save
      render 'show.json.jbuilder'
    else 
      render json: {errors: @healthcare_provider.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @healthcare_provider = HealthcareProvider.find(params[:id])
    render 'show.json.jbuilder'
  end 

  def update
    @healthcare_provider = HealthcareProvider.find(params[:id])

    @healthcare_provider.name = params[:name] || @healthcare_provider.name
    @healthcare_provider.position= params[:position] || @healthcare_provider.position
    @healthcare_provider.employee_number = params[:employee_number] || @healthcare_provider.employee_number
    @healthcare_provider.password = params[:password] || @healthcare_provider.password
    @healthcare_provider.password_confirmation = params[:password_confirmation] || @healthcare_provider.password_confirmation

     if @healthcare_provider.save
      render 'show.json.jbuilder'
    else 
      render json: {errors: @healthcare_provider.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @healthcare_provider = HealthcareProvider.find(params[:id])
    @healthcare_provider.destroy
    render json: {message: "Healthcare Provider successfully destroyed."}
  end 
end

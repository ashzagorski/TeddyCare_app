class Api::SessionsController < ApplicationController

  def create
    healthcare_provider = HealthcareProvider.find_by(employee_number: params[:employee_number])
    if healthcare_provider && healthcare_provider.authenticate(params[:password])
      jwt = JWT.encode(
        {
         healthcare_provider_id: healthcare_provider.id, # the data to encode
         exp: 24.hours.from_now.to_i # the expiration time
         },
         Rails.application.credentials.fetch(:secret_key_base), # the secret key
         'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, employee_number: healthcare_provider.employee_number, id: healthcare_provider.id, name: healthcare_provider.name }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end

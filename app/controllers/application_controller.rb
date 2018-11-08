class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

   def current_healthcare_provider
    auth_headers = request.headers['Authorization']
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: 'HS256' }
        )
        @current_healthcare_provider = HealthcareProvider.find_by(id: decoded_token[0]["healthcare_provider_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_healthcare_provider

def authenticate_healthcare_provider
    unless current_healthcare_provider
      render json: {}, status: :unauthorized
    end  
  end 

  def authenticate_admin
    unless current_healthcare_provider && current_healthcare_provider.admin 
      render json: {}, status: :unauthorized
    end 
  end

end

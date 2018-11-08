class AlexaController < ApplicationController
   def index
    render json: Ralyxa::Skill.handle(request)
  end
end

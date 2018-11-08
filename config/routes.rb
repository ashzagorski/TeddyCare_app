Rails.application.routes.draw do
  namespace :api do
    get '/patients' => 'patients#index'
    post '/patients' => 'patients#create'
    get '/patients/:id' => 'patients#show'
    patch '/patients/:id' => 'patients#update'
    delete '/patients/:id' => 'patients#destroy'

    get '/healthcare_providers' => 'healthcare_providers#index'
    post '/healthcare_providers' => 'healthcare_providers#create'
    get '/healthcare_providers/:id' => 'healthcare_providers#show'
    patch '/healthcare_providers/:id' => 'healthcare_providers#update'
    delete '/healthcare_providers/:id' => 'healthcare_providers#destroy'

    get '/visits' => 'visits#index'
    post '/visits' => 'visits#create'
    get '/visits/:id' => 'visits#show'
    patch '/visits/:id' => 'visits#update'
    delete '/visits/:id' => 'visits#destroy'

    get 'questions' => 'questions#index'
    get 'questions/:id' => 'questions#show'

    post "/sessions" => "sessions#create"


    get '/documented_answers' => 'documented_answers#index'
    post '/documented_answers' => 'documented_answers#create'
     get '/documented_answers/:id' => 'documented_answers#show'
    patch '/documented_answers/:id' => 'documented_answers#update'
    delete '/documented_answers/:id' => 'documented_answers#destroy'
    
  end 

  post '/', to: 'alexa#index'
end

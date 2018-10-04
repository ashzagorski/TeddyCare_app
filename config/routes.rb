Rails.application.routes.draw do
  namespace :api do
    get '/patients' => 'patients#index'
    post '/patients' => 'patients#create'
    get '/patients/:id' => 'patients#show'
    patch '/patients/:id' => 'patients#update'
    delete '/patients/:id' => 'patients#destroy'
  end 
end

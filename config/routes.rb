Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create]
    end
  end

  get '/join', to: 'sessions#new'
  
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#create'
end

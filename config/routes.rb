Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index, :create, :edit, :update, :destroy]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create]
    end
  end

  resources :users, only: [:create]

  get '/join', to: 'sessions#join'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/links/:id/read', to: 'links#read', as: :read_link

  get '/links/:id/mark_read', to: 'links#mark_read', as: 'mark_as_read'
  get '/links/:id/mark_unread', to: 'links#mark_unread', as: 'mark_as_unread'
end

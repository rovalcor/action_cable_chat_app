Rails.application.routes.draw do
  root 'messages#index'
  resources :users
  resources :messages
  resources :conversations, only: [:show, :create] do
    member do
      post 'message' => 'conversations#create_message' 
    end
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  mount ActionCable.server, at: '/cable'
end

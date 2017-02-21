Rails.application.routes.draw do
  root 'conversations#index'
  resources :users
  resources :messages
  resources :conversations do
    member do
      post 'message' => 'conversations#send_message'
    end
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  mount ActionCable.server, at: '/cable'
end

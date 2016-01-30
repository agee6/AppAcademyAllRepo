Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  get 'session/new', to: 'sessions#new', as: 'new_session'
  post 'session', to:'sessions#create', as: 'session'
  delete 'session', to:'sessions#destroy', as: 'session_destroy'

  resources :subs, except: [:destroy]
  resources :posts, except: [:destroy, :index]
end

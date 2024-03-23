Rails.application.routes.draw do
  root 'static_pages#top'

  resources :users, only: %i[new create]
  resources :posts, only: %i[new create index]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end

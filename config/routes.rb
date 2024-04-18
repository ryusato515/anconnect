Rails.application.routes.draw do
  root 'static_pages#top'

  resources :users, only: %i[new create show update]
  resources :posts, only: %i[new create index show edit update destroy] do
    collection do
      get 'search'
      get 'favorite'
    end
  end
  resources :favorites, only: %i[index create destroy]

  resource :profile, only: %i[index show edit update] do
  end
  get 'profile/index', to: 'profiles#index'
  get 'favorite/index', to: 'favorites#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get '/assets/*source', to: Proc.new{ |env| 
  Rails.application.assets_resolver.call(env)
  }, format: false
end
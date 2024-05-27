Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'static_pages#top'
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  resources :users, only: %i[new create]
  resources :posts, only: %i[new create index show edit update destroy] do
    collection do
      get 'search'
      get 'favorite'
      get 'location_map'
    end
  end

  resources :favorites, only: %i[index create destroy] do
    get 'location_map', on: :collection
  end

  resource :profile, only: %i[show edit update]
  resources :my_posts, only: :index do
    get 'location_map', on: :collection
  end
  resources :password_resets, only: %i[new create edit update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get '/assets/*source', to: Proc.new{ |env| 
  Rails.application.assets_resolver.call(env)
  }, format: false
end
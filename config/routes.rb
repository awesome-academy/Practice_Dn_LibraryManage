<<<<<<< HEAD
# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#Home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  scope '(:locale)', locale: /en|vi/ do
    resources :users
  end

  resources :users do
    member do
      get :followings, :followers
    end
  end
  resources :users
  resources :follows, only: %i[create destroy]
=======
Rails.application.routes.draw do
  root "static_pages#Home"

  get "/login",to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/loguot", to:"sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup",  to: "users#create"

  scope "(:locale)", locale: /en|vi/ do
    resources :users
  end


>>>>>>> 0279bce42717a994b51c4c1880b8762ec6396282
end

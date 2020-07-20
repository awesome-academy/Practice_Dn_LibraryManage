Rails.application.routes.draw do
  get '/authors', to:'authors#new'
  get '/books', to:'books#new'
  root 'static_pages#Home'

  get '/login',to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/loguot', to:'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  scope "(:locale)", locale: /en|vi/ do
  end

  resources :users do
    member do
      get :followings, :followers
      end
    end
  resources :users
  resources :follows , only: [:create, :destroy]
end

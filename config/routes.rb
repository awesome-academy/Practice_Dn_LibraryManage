Rails.application.routes.draw do
  root 'static_pages#Home'
  devise_for :users
  resources :books
	resources :authors
  get '/login',to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/loguot', to:'sessions#destroy'
  get '/signup', to: 'users#new'
end

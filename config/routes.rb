Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/about', to: 'static_pages#about'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/problems', to: 'problems#index'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :problems, only: [:create, :edit, :show, :update, :destroy] 
end

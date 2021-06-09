Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  root to: 'tasks#index'
  resources :tasks
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end

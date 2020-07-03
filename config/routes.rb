Rails.application.routes.draw do
  root to: 'dashboard#home'
  get '/welcome' => 'dashboard#welcome'
  get '/dashboard' => "dashboard#dash"

  
  resources :owners, only: [:show, :new, :create, :edit, :update]
  resources :individuals
  resources :places
  resources :visits
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

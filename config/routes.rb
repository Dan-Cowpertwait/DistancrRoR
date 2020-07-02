Rails.application.routes.draw do
  resources :places
  root to: 'dashboard#home'
  get '/welcome' => 'dashboard#welcome'
  get '/dashboard' => "dashboard#dash"


  resources :owners
  resources :individuals
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

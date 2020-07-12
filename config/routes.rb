Rails.application.routes.draw do
  root to: 'dashboard#home'
  get '/welcome' => 'dashboard#welcome'
  get '/dashboard' => "dashboard#dash"
  get '/search' => "places#search"

  resources :places
  resources :owners, only: [:show, :new, :create, :edit, :update] do
    resources :places
  end
  #new_owner_place_path! + /owner/owner_id/places/new
  resources :individuals
  resources :visits
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth', registrations: 'registrations'}
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  get 'tutuer/index'
  root 'tutuer#index'
  resources :tickets
  resource :search, only: [:show, :create]

  namespace :admin do
    resources :trains do
      resources :wagons, shallow: true
    end
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_arrive, on: :member
      patch :update_departure, on: :member
    end
    resources :routes
    resources :users
    resources :tickets
    resources :panels, only: [:index]
  end

  get 'railway_stations/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

Rails.application.routes.draw do
  get 'tutuer/index'
  root 'tutuer#index'
  resources :trains do
    resources :wagons, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_arrive, on: :member
    patch :update_departure, on: :member
  end
  resources :routes
  resources :tickets
  resources :users
  resource :search, only: [:new, :show, :edit]

  get 'railway_stations/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

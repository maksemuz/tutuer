Rails.application.routes.draw do
  get 'tutuer/index'
  root 'tutuer#index'
  resources :trains
  resources :railway_stations
  resources :routes
  get 'railway_stations/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

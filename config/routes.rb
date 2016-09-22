Rails.application.routes.draw do
  resources :trains do
    resources :wagons, shallow: true
  end

  resources :railway_stations
  resources :routes
  resources :wagons

  post 'update_position/:id', to: 'railway_stations#update_position', as: 'update_position'

  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

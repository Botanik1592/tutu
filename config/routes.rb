Rails.application.routes.draw do
  devise_for :users

  resource :search, only: [:show, :create]

  resources :tickets do
    post :order, on: :collection
  end

  namespace :admin do
    resources :trains do
      resources :wagons, shallow: true
    end

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_arrival_time, on: :member
      patch :update_departure_time, on: :member
    end

    resources :routes
    resources :wagons
    resources :wagon_types
    resources :users
    resources :tickets

    get 'adminpanel/index'
    root 'adminpanel#index'
  end

  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

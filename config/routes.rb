Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index', as: :root

  resources :structures, only: [:index, :show]
  resources :floors, only: [:show] do
    resources :spots, only: [:show]
  end
  
  namespace :admin do
    resources :structures, only: [:new, :create]
  end

  namespace :floors do
    get '/:id/motorcycles/new', to: 'motorcycles#new', as: :park_motorcycle
    get '/:id/cars/new', to: 'cars#new', as: :park_car
    get '/:id/buses/new', to: 'buses#new', as: :park_bus
  end

  get '/login', to: 'sessions#create', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout

  get '*path', to: 'welcome#error404'
end

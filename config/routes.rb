Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index', as: :root

  resources :structures, only: [:index, :show]

  namespace :admin do
    resources :structures, only: [:new, :create]
  end

  get '/login', to: 'sessions#create', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout

  get '*path', to: 'welcome#error404'
end

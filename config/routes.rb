Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/profile', to: 'users#show'
  get '/payments/new', to: 'payments#new'
  post "/payments", to: 'payments#create'
  get '/payments/complete', to: 'payments#complete'
  resources :users, only: [:new, :update]

  resources :styles, only: [:index]

  resources :shops, only: [:show, :new, :index, :create] do
    resources :users, only: [:new, :create, :show]
  end
end

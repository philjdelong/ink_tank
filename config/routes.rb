Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'

  post '/payments/new', to: 'payments#new'
  get '/advice', to: 'advice#show'
  resources :artists, only: [:new, :update, :show]

  resources :styles, only: [:index, :show]

  resources :shops, only: [:show, :new, :index, :create, :update] do
    resources :artists, only: [:new, :create, :show]
  end

  resources :artists do
    resources :appointments, only: [:index, :create, :show]
  end

  namespace :artist do
    resources :dashboard
    resources :appointments
  end
end

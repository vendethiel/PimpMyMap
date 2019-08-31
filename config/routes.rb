Rails.application.routes.draw do
  resources :maps do
    member do
      post 'rate', to: 'ratings#create'
    end
  end
  devise_for :users

  resources :users, only: [:show]

  root to: 'maps#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

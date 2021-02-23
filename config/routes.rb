Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :yurts do
    resources :bookings, only: [:index, :new, :create]
  end
  resources :bookings, only: [:show, :index]

  get '/profile', to: "pages#profile"
end

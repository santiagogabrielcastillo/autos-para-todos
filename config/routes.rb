Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'owner', to: 'automobiles#owner', as: :owner
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :automobiles, except: %i[destroy] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index show]
end

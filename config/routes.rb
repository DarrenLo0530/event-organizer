Rails.application.routes.draw do
  root "events#index"
  devise_for :users
  resources :events do
    resources :event_registrations, only: [:create], as: "registrations"
    resources :invites, only: [:create]
  end
  resources :users, only: [:show, :index]
  resources :invites, only: [:index, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

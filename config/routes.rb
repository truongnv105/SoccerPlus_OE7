Rails.application.routes.draw do
  get 'matches/index'
  get 'teams/index'
  devise_for :admins, :skip => [:registrations], path_names: {
    sign_up: ""
  }

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  mount ActionCable.server => "/cable"

  root "static_pages#index"
  devise_for :users,
    controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  devise_scope :user do
    get "/signup", to: "devise/registrations#new"
    get "/login", to: "devise/sessions#new"
    delete "logout", to: "devise/sessions#destroy"
  end
  resources :users, only: :show
  resources :news, only: :index
  resources :chat_rooms, param: :name
  resources :messages
  resources :matches, param: :name do
    resources :chat_rooms
  end
  resources :teams
end

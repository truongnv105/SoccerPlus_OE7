Rails.application.routes.draw do
  root "static_pages#index"
  devise_for :users

  devise_scope :user do
    get "/signup", to: "devise/registrations#new"
    get "/login", to: "devise/sessions#new"
    delete "logout", to: "devise/sessions#destroy"
  end

  resources :users, only: :show
end

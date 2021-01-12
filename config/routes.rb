# NOTE: For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

  # CONFIG
  root "pages#index"

  # SESSION MANAGEMENT
  devise_for :users,
    controllers: {
      registrations: "users/registrations",
      sessions:      "users/sessions"
    }

  authenticated do
    # root to: "dashboard#index", as: :authenticated
  end

  # STATIC PAGES
  get "/welcome", to: "pages#welcome"

  # DYNAMIC PAGES

  get "/examples", to: "examples#index"
  get "/example",  to: "examples#show"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :books, only: %i[index]
    end
  end

end # Rails.application.routes

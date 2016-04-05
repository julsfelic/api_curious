Rails.application.routes.draw do
  root to: "static_pages#home"

  get "/auth/twitter", as: :twitter_login
  get "/auth/twitter/callback", to: "sessions#create"
end

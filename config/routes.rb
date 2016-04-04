Rails.application.routes.draw do
  root to: "static_pages#home"

  get "/auth/twitter", as: :twitter_login
end

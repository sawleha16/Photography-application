Rails.application.routes.draw do
  root "albums#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  get "/albums", to: "albums#index"
  post "/albums", to: "albums#create"
  get "/albums/:id/edit", to: "albums#edit"
  get "/albums/new", to: "albums#new"
  get "/albums/:id", to: "albums#show"
  get "/albums", to: "albums#form"


end

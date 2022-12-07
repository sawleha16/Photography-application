Rails.application.routes.draw do
  root "albums#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  get "/albums", to: "albums#index"
  post "/albums", to: "albums#create"
  get "/albums/:id/edit", to: "albums#edit"
  put "/albums/:id", to: "albums#update"
  patch "/albums/:id", to: "albums#update"
  get "/albums/new", to: "albums#new"
  get "/albums/:id", to: "albums#show"
  get "/albums", to: "albums#form"
  delete "/albums/:id", to: "albums#destroy"
<<<<<<< HEAD
=======


>>>>>>> 26a98beddbd712316bc56ac363d1bd3273399f5b
end

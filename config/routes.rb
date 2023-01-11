Rails.application.routes.draw do
  root "albums#index"
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  get "/albums", to: "albums#index"
  get "/albums/new", to: "albums#new"
  post "/albums", to: "albums#create"
  get "/albums/:id/edit", to: "albums#edit"
  put "/albums/:id", to: "albums#update"
  patch "/albums/:id", to: "albums#update"
  get "/albums/:id", to: "albums#show"
  delete "/albums/:id", to: "albums#destroy"

  get "/albums/:album_id/photos/new", to: "photos#new"
  post "/albums/:album_id/photos", to: 'photos#create'
  get "/albums/:album_id/photos/:id/edit", to: 'photos#edit'
  put "/albums/:album_id/photos/:id", to: "photos#update"
  patch "/albums/:album_id/photos/:id", to: "photos#update"
  get "/albums/:album_id/photos/:id", to: "photos#show"
  delete "/albums/:album_id/photos/:id", to: "photos#destroy"

  post "/albums/:album_id/photos/:photo_id/comments", to: 'comments#create'
  get "/albums/:album_id/photos/:photo_id/comments/:id/edit", to: 'comments#edit'
  put "/albums/:album_id/photos/:photo_id/comments/:id", to: 'comments#update'
  patch "/albums/:album_id/photos/:photo_id/comments/:id", to: 'comments#update'
  delete "/albums/:album_id/photos/:photo_id/comments/:id", to: 'comments#destroy'
end

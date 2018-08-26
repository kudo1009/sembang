Rails.application.routes.draw do
  
  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show]
  
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/confirm" => "posts#confirm"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  
  root "/" => "home#top"
  get "about" => "home#about"
  
end

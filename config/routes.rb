Rails.application.routes.draw do
  root "home#top"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  
  resources :posts do
    collection do
      post :confirm
    end
  end
  
  
  resources :favorites, only: [:create, :destroy]
  get "users/:id/favorites", to: "users#favorites"
  
  
  get "about", to: "home#about"
  
end

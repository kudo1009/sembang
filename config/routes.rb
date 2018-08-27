Rails.application.routes.draw do
  root "home#top"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  
  resources :posts do
    collection do
      post :confirm
    end
  end
  
  get "about", to: "home#about"
  
end

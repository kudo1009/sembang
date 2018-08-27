Rails.application.routes.draw do
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  
  resources :posts, only: [:show, :edit, :update, :destroy]
  resources :posts do
    collection do
      post :confirm
    end
  end
  resource :post, only: [:index, :new, :create]
  
  
  
  root "home#top"
  get "about" => "home#about"
  
end

Rails.application.routes.draw do
  root "home#top"
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  resources :posts do
    collection do
      post :confirm
    end
  end
  
  resources :favorites, only: [:create, :destroy, :show]
  get "about", to: "home#about"
  
end

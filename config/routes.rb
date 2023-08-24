Rails.application.routes.draw do
  devise_for :users
  resources :profiles
  resources :tweets do
    member do
      put "vote", to: "tweets#vote"
      post "retweet", to: "tweets#retweet"
    end
    resources :comments
  end
  root "tweets#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

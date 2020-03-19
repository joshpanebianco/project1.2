Rails.application.routes.draw do
  devise_for :accounts
  get "u/:username" => "public#profile", as: :profile

  resources :communities do
   resources :posts
  end
	root to: "public#index"

  resources :subscriptions
  resources :comments, only: [:create]

  post "post/vote" => "votes#create"

end

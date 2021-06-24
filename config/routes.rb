Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/dashboard" => "accounts#index"
  get "/profile/:username" => "accounts#profile", as: :profile
  get "post/like/:post_id" => "likes#save_like", as: :like_post
  post "follow/account" => "accounts#follow_account", as: :follow_account

  get "post/:id" => "posts#show", as: :post

  resource :posts, only: [:new, :create, :show]
  resource :comments, only: [:create, :destroy]

  root to: "public#homepage"
end

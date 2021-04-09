Rails.application.routes.draw do

  get 'relationships/following'
  get 'relationships/follower'

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users,only: [:show,:index,:edit,:update] do
     member do
      get :following, :followers
    end
  end

  resources :books
  resources :relationships, only: [:create, :destroy]
end
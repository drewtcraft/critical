Rails.application.routes.draw do
  devise_for :users

  resources :comments
  resources :posts do
    resources :comments
  end

  root "posts#index"
end

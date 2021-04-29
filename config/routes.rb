Rails.application.routes.draw do
  root to: "posts#index"
  get "policy", to: "foorters#policy"
  get "privacypolicy", to: "foorters#privacypolicy"

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  resources :users, only: %i[show]

  resources :posts do
    collection do
      get "search"
    end
    resources :comments, only: %i[create edit update destroy]
  end

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end

  resources :categories, only: %i[index show]
end

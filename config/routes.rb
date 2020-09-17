Rails.application.routes.draw do
  root to: 'posts#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show] do
    
  end

  resources :posts do 
    collection do
      get 'search'
    end
    resources :comments, only: %i[create edit update]
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end

Rails.application.routes.draw do
  get 'products/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Dashboard et mise à jour du profil
  get 'dashboard', to: 'pages#dashboard'
  patch 'update_profile_picture', to: 'pages#update_profile_picture'

  # Defines the root path route ("/")
  # root "posts#index"

  resources :products do
    resources :reviews, only: [:create]
  end


    # User routes
    # devise_scope :user do
    #   authenticated :user do
    #     root 'products#inex', as: :authenticated_root
    #   end
    #   unauthenticated do
    #     root 'pages#home', as: :unauthenticated_root
    #   end
    # end
  resources :users do
    resources :bookings do
      get :confirm, on: :member
    end
  end
end

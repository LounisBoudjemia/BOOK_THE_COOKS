Rails.application.routes.draw do
  devise_for :users
  root to: redirect('/services')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :services do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: [:destroy]

  authenticated :user do
    get "profile", to: "users#profile"
  end

  unauthenticated do
    get "profile", to: "services#index" # Define the services route
  end
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    # Nested route for posts under a specific user
    resources :posts, only: [:index, :show]
  end

  # Defines the root path route ("/")
  root "users#index"
end

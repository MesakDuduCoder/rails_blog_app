Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users

  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
         resources :comments, only: [:index, :create]
        end
      end
    end
  end

  root to: "users#index"
end

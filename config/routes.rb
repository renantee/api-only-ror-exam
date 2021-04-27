Rails.application.routes.draw do
  # url http://localhost:3000/apipie
  apipie

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'api/v1/posts#index'

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :posts, only: [:index, :show, :create, :update, :destroy], param: :slug do
        resources :comments, only: [:index, :create, :update, :destroy]
      end
      resources :register, only: [:create]
      post 'login', to: "auth#login"
      post 'logout', to: "auth#logout"
    end
  end

end

Rails.application.routes.draw do
  # url http://localhost:3000/apipie
  apipie

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'api/v1/posts#index'

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :posts, only: [:index], param: :slug
    end
  end

end

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :auctions, only: [:index, :show, :create, :destroy] do
        resources :bids, only: [:create]
      end
      resource :sessions, only: [:create, :destroy]
    end
  end
end

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :indices_stocks, only: :index
      resources :identifier_stocks, only: %i[index show]
      resources :users, only: %i[index show]
      resources :stocks, only: %i[index show]
      resources :teams, only: %i[index show]
      resources :transactions, only: %i[create index show]

      scope :wallets, controller: 'wallets' do
        get 'detail'
      end

      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
    end
  end
end

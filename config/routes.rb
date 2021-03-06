Rails.application.routes.draw do

  root to: 'api/v1#show'

  get 'api', to: 'api/v1#show'

  namespace :api do
    get 'v1', to: 'v1#show'
    namespace :v1 do
      resources :users, only: [:show, :update] do
        resources :tackle
      end
    end
  end
end

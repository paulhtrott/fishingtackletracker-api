Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        resources :tackle, only: [:index, :show]
      end
    end
  end
end

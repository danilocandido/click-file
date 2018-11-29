Rails.application.routes.draw do
  root to: 'file_systems#index'

  resources :file_systems, only: [:index] do
    post :create
  end
end

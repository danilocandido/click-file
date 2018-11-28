Rails.application.routes.draw do
  root to: 'file_systems#index'

  resources :file_systems, only: [:index, :create, :show] do
    get :new
  end
end

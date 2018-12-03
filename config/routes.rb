Rails.application.routes.draw do
  root to: 'file_systems#index'

  resources :file_systems, only: [:index] do
    post :create
    get :show_files, on: :collection
  end
  get '/file_systems/show_modal/:id', to: 'file_systems#show_modal', as: :show_modal_upload
end

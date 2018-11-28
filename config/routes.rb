Rails.application.routes.draw do
  resources :file_systems, only: :index
end

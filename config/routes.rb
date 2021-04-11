Rails.application.routes.draw do
  resources :links, only: [:index, :create]

  root 'links#index'
end

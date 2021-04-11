Rails.application.routes.draw do
  resources :links, only: [:index, :create]

  root 'links#index'
  get '/:short_url' => 'links#go_to_link'
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources 'rooms', only: [:index, :create] do
    resources 'messages', only: [:index, :create]
  end
end

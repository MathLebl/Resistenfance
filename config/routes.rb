Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/create'
  get 'comments/update'
  get 'comments/destroy'
  resources :audio_messages, only: %i[index show new create destroy]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

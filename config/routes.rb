Rails.application.routes.draw do
  resources :audio_messages, only: %i[index show new create destroy]
  resources :comments, only: %i[index create update destroy]
  resources :resistenfant, :controller => 'users', only: %i[show]
  devise_for :users, controllers: { confirmations: 'confirmations' }
  get 'about', to: 'pages#about'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

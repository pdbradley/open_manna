require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :subscriptions do
    member do
      get 'pause', as: 'pause'
      get 'activate', as: 'activate'
    end
  end

  get 'start', as: 'start_verification', controller: 'verifications'
  resources :verifications, only: [:edit, :update]


  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  mount Sidekiq::Web, at: '/sidekiq'
end

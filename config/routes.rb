Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :users ,only:[:show]
  get 'messages_seconds/create'
  get 'apps/show'
  get 'users/show'
  get 'messages/new'
  resources :items do
    resources :orders, only: [:index, :create]
    resources :messages, only: [:create]
    resources :messages_second, only: [:create]
    collection do
      get 'search'
    end
  end
end

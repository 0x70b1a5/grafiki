Rails.application.routes.draw do
  get 'pages/about'

  resources :candidates

  get 'escrows/new'
  post 'escrows/new'

  devise_for :users
  get 'login' => "sessions#new"
  post 'login' => "sessions#create"
  get 'logout' => "sessions#destroy", as: :log_out

  resources :bounties do
    member do
      post 'vote'
      post 'fill'
      get  'fill'
      get  'award'
      post 'award'
      get  'detail'
      get  'show'
    end

    collection do
      get 'filled'
      get 'search'
      get  'upload'
      post 'upload'
      get 'pending'
      post 'pending'
    end
  end

  resources :escrows

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'map#index'
end

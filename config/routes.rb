Rails.application.routes.draw do
  devise_for :users
  get 'login' => "sessions#new"
  post 'login' => "sessions#create"
  get 'logout' => "sessions#destroy", as: :log_out

  resources :bounties do
    member do
      post 'vote'
      post 'fill'
      get  'fill'
    end

    collection do
      get 'filled'
      get 'search'
      get  'upload'
      post 'upload'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'map#index'
end

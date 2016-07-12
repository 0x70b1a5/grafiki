Rails.application.routes.draw do
  resources :bounties do
    member do
      post 'vote'
      post 'fill'
      get 'fill'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'map#index'
end

Rails.application.routes.draw do
  resources :bounties

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'map#index'
end

Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  get 'welcome/about'

  get 'items/create'

  resources :users do
    resources :items, only: [:create]
  end

  root 'users#show'

  # root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

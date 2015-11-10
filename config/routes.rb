Rails.application.routes.draw do
  resources :wikis
  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

  resources :charges, only: [:new, :create]
  get 'charges/downgrade'

end

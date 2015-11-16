Rails.application.routes.draw do
  get 'collaborators/index'

  resources :wikis do
    resources :collaborators, only: [:index, :create, :destroy]
  end

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

  resources :charges, only: [:new, :create]
  get 'charges/downgrade'

end

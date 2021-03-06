Rails.application.routes.draw do
  root 'posts#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]


  resources :posts do
    resources :comments, only: [:create]
  end
end

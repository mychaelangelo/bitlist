Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update]
  # The default page when user enters home page URL
  root to: 'welcome#index'

  get 'welcome/index'

  get 'welcome/about'

  resources :todos, only: [:new, :create, :show, :index, :destroy]

end

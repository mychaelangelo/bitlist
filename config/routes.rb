Rails.application.routes.draw do
  
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/profile/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  resources :users, only: [:update]
  # The default page when user enters home page URL
  root to: 'welcome#index'

  get 'welcome/index'

  get 'welcome/about'

  resources :todos, only: [:new, :create, :show, :index, :destroy, :update]


end

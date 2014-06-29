Rails.application.routes.draw do
  
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', :registrations => 'registrations' }

  match '/profile/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  resources :users, only: [:update, :show]
  # The default page when user enters home page URL
  root to: 'welcome#about'

  get 'welcome/index'

  get 'welcome/about'

  resources :todos do
    # route for 'done' controller method in todos for marking action as complete
    member do
      get 'done'
    end
  end


end

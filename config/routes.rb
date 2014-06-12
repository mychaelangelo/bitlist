Rails.application.routes.draw do
  
  # The default page when user enters home page URL
  root to: 'welcome#index'

  get 'welcome/index'

  get 'welcome/about'

end

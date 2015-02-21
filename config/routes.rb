Rails.application.routes.draw do

  get 'pages/index'

  get 'pages/tips'

  get 'pages/contact'

  get 'pages/about'

  resources :products

  root 'welcome#index'

end

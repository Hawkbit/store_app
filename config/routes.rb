Rails.application.routes.draw do

  get 'pages/index'

  get 'pages/tips'

  get 'pages/contact'

  get 'pages/about'

  get 'welcome/index'

  resources :products

  root 'pages#index'

end

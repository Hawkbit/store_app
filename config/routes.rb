Rails.application.routes.draw do

  root 'pages#index'

  get 'index' 	=> 'pages#index' 
  get 'tips'		=> 'pages#tips'
  get 'contact'	=> 'pages#contact'
  get 'about'		=> 'pages#about'
  get 'welcome/index'	=> 'welcome#index'
  get 'products'	=> 'products#index'

  resources :products



end

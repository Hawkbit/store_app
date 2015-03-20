Rails.application.routes.draw do

  devise_for :users, :controllers => {sessions: 'sessions'}
  
  resources :line_items

  resources :carts

  root 'pages#index'

  get 'index' 	=> 'pages#index' 
  get 'tips'		=> 'pages#tips'
  get 'contact'	=> 'pages#contact'
  get 'about'		=> 'pages#about'
  get 'articles' => 'pages#articles'
  get 'videos'  => 'pages#videos'
  get 'welcome/index'	=> 'welcome#index'
  resources :products
  


end

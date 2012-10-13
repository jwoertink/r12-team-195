Mybestdrink::Application.routes.draw do

  devise_for :users

  resources :wares

  resources :drinks do
    resources :ratings
  end
  
  resources :users
  root :to => 'site#index'
end

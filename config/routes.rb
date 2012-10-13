Mybestdrink::Application.routes.draw do

  get "dashboard/index"

  devise_for :users

  resources :drinks do
    resources :ratings
  end
  
  resources :users
  root :to => 'site#index'
  
  namespace :admin do
    root :to => 'dashboard#index'
    resources :wares
  end
end

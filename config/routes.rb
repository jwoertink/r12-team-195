Mybestdrink::Application.routes.draw do

  get "dashboard/index"

  devise_for :users

  resources :wares, :path => 'learn-mixology', :only => [:index, :show]

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

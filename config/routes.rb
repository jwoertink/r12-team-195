Mybestdrink::Application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :wares, :path => 'learn-mixology', :only => [:index, :show]

  resources :drinks do
    resources :ratings
  end
  
  match "/mixologists", to: "site#mixologists"

  root :to => 'site#index'
  
  namespace :admin do
    root :to => 'dashboard#index'
    resources :wares
  end
end

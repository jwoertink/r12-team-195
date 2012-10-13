Mybestdrink::Application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get "sign_out", to: "devise/sessions#destroy"
  end

  resources :wares, :path => 'learn-mixology', :only => [:index, :show]

  resources :drinks do
    resources :ratings
  end

  namespace :user do
    resources :drinks
  end

  
  match "/mixologists", to: "site#mixologists"

  root :to => 'site#index'
  
  namespace :admin do
    root :to => 'dashboard#index'
    resources :wares
  end
end

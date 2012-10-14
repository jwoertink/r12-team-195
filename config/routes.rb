Mybestdrink::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get "sign_out", to: "devise/sessions#destroy"
  end

  resources :wares, only: [:show, :index]
  resources :wares, path: 'learn-mixology', only: [:index, :show]

  resources :drinks, only: [:index, :show] do
    resources :ratings
    get :autocomplete_drink_name, on: :collection
  end

  resources :ingredients
  resources :anonymous_users, path: 'blah', only: [:index, :show]
  resources :users, path: 'mixologists', only: [:index, :show] do
    resources :connections, except: [ :show, :new, :edit, :update ] do
      collection do
        get 'follows/:username', action: "follows"
      end
    end
  end

  namespace :user do
    resources :drinks
  end

  match '/search' => 'search#index'

  root to: 'site#index'

  namespace :admin do
    root to: 'dashboard#index'
    resources :wares
  end
end

Rails.application.routes.draw do
  root to: 'tasks#index'

  resource :sessions, only: [:new, :create, :destroy]
  resources :tasks do
    member do
      patch :state
    end
  end
end

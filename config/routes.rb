Rails.application.routes.draw do
  root to: 'tasks#index'

  resource :sessions, only: [:new, :create, :destroy]
end

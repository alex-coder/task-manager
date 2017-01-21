Rails.application.routes.draw do
  scope module: :web do
    root to: 'tasks#index'

    resource :sessions, only: [:new, :create, :destroy]
    resources :tasks
  end

  namespace :api do
    resources :tasks, only: [] do
      patch :state
    end
  end
end

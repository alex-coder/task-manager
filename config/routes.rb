Rails.application.routes.draw do
  scope module: :web do
    root to: 'tasks#index'

    resource :sessions, only: [:new, :create, :destroy]
    resources :tasks, only: [:index]

    resource :users, only: [] do
      scope module: :users do
        resources :tasks
      end
    end
  end

  namespace :api do
    resources :tasks, only: [] do
      patch :state
    end
  end
end

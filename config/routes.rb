Rails.application.routes.draw do
  resource :sessions, only: [:new, :create, :destroy]
end

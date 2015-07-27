Rails.application.routes.draw do
  resources :polls, only: [:new, :create, :show]
end

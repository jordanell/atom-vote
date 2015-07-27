Rails.application.routes.draw do
  root to: 'polls#new'

  resources :polls, only: [:new, :create, :show]

  match ':uuid', to: 'polls#show', via: [:get]
end

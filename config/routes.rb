Rails.application.routes.draw do
  root to: 'polls#new'

  resources :polls, only: [:new, :create, :show] do
    member do
      get :results
    end
  end

  resources :votes, only: [:create]

  match ':uuid', to: 'polls#show', via: [:get]
end

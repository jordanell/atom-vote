Rails.application.routes.draw do
  # Root
  root to: 'polls#new'

  # Slack API
  namespace :api do
    namespace :slack do
      resource :polls, only: [:create]
    end
  end

  # Polls
  resources :polls, only: [:new, :create, :show] do
    member do
      get :results
    end
  end

  # Votes
  resources :votes, only: [:create]

  # Pages
  resources :pages, only: [:show]

  # Error handling
  %w( 404 500 ).each do |code|
    get code, to: 'errors#show', as: "error_#{code}", code: code
  end

  # Polls are matched by uuid
  match ':uuid', to: 'polls#show', via: [:get]
end

Rails.application.routes.draw do
  root 'game_nights#index'

  resources :players do
    resource :game_library, only: %i(show new create update)
  end

  resources :game_nights
end

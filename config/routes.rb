Rails.application.routes.draw do
  root 'game_nights#index'

  resources :players
  resources :game_nights
end

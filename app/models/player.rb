class Player < ApplicationRecord
  belongs_to :game_night, optional: true
end

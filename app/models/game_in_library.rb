class GameInLibrary < ApplicationRecord
  self.table_name = 'games_in_libraries'

  belongs_to :game_library
  belongs_to :game
end

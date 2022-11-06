class GameLibrary < ApplicationRecord
  belongs_to :player
  has_many :games_in_library, class_name: 'GameInLibrary', foreign_key: 'game_library_id'
  has_many :games, through: :games_in_library

  validates :bgg_username, presence: true
end

class GameLibrary < ApplicationRecord
  belongs_to :player
  has_many :games_in_libraries
  has_many :games, through: :games_in_libraries

  validates :bgg_username, presence: true
end

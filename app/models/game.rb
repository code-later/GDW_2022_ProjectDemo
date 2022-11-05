class Game < ApplicationRecord
  has_many :game_libraries
  has_many :owners, class_name: 'Player', foreign_key: 'player_id'

  validates :name, presence: true
  validates :external_id, presence: true
  validates :picture_url, presence: true
  validates :rating, presence: true
end

class Game < ApplicationRecord
  has_many :game_libraries

  validates :name, presence: true
  validates :external_id, presence: true
  validates :picture_url, presence: true
  validates :rating, presence: true
end

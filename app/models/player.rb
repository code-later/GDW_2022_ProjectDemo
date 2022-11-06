class Player < ApplicationRecord
  belongs_to :game_night, optional: true

  has_one :game_library

  validates :name, presence: true
  validates :email, presence: true
  validates :nickname, presence: true
end

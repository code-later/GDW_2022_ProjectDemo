class Player < ApplicationRecord
  belongs_to :game_night, optional: true

  validates :name, presence: true
  validates :email, presence: true
  validates :nickname, presence: true
end

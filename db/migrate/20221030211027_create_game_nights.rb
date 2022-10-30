class CreateGameNights < ActiveRecord::Migration[7.0]
  def change
    create_table :game_nights do |t|
      t.string :title
      t.datetime :takes_place_at

      t.timestamps
    end
  end
end

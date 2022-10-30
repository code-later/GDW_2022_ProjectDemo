class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :nickname
      t.references :game_night, foreign_key: true

      t.timestamps
    end
    add_index :players, :email, unique: true
    add_index :players, :nickname, unique: true
  end
end

class CreateGameLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :game_libraries do |t|
      t.belongs_to :player, foreign_key: true, null: false, unique: true

      t.string :bgg_username, null: false
      t.boolean :bgg_sync_completed, default: false

      t.timestamps
    end

    create_table :games_in_libraries do |t|
      t.belongs_to :game, foreign_key: true, null: false
      t.belongs_to :game_library, foreign_key: true, null: false
    end

    add_index :games_in_libraries, [:game_library_id, :game_id], unique: true
  end
end

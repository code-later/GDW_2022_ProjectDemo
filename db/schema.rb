# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_05_111103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_libraries", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.string "bgg_username", null: false
    t.boolean "bgg_sync_completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_game_libraries_on_player_id"
  end

  create_table "game_nights", force: :cascade do |t|
    t.string "title"
    t.datetime "takes_place_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "external_id"
    t.string "picture_url"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games_in_libraries", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "game_library_id", null: false
    t.index ["game_id"], name: "index_games_in_libraries_on_game_id"
    t.index ["game_library_id", "game_id"], name: "index_games_in_libraries_on_game_library_id_and_game_id", unique: true
    t.index ["game_library_id"], name: "index_games_in_libraries_on_game_library_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "nickname"
    t.bigint "game_night_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["game_night_id"], name: "index_players_on_game_night_id"
    t.index ["nickname"], name: "index_players_on_nickname", unique: true
  end

  add_foreign_key "game_libraries", "players"
  add_foreign_key "games_in_libraries", "game_libraries"
  add_foreign_key "games_in_libraries", "games"
  add_foreign_key "players", "game_nights"
end

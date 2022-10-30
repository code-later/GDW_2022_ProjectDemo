json.extract! player, :id, :name, :email, :nickname, :game_night_id, :created_at, :updated_at
json.url player_url(player, format: :json)

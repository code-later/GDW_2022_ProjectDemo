if player.new_record?
  json.extract! player, :name, :email, :nickname
  json.url players_url
else
  json.extract! player, :id, :name, :email, :nickname, :game_night_id, :created_at, :updated_at
  json.url player_url(player)
end

json.extract! game_night, :id, :title, :takes_place_at, :created_at, :updated_at

json.players do
  json.array! game_night.players do |player|
    json.url player_url(player)
  end
end

json.url game_night_url(game_night)

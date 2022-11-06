json.total_games @game_library.games.count

json.games do
  json.array! @game_library.games do |game|
    json.url game_url(game)
  end
end

json.bgg_sync do
  json.completed @game_library.bgg_sync_completed
  json.url player_game_library_url(player_id: @player)
end

json.player do
  json.name @player.name
  json.url player_url(@player)
end

json.url game_library(@game_library)

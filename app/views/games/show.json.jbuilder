json.extract! @game, :id, :name, :picture_url

json.rating number_with_precision(@game.rating, precision: 1)

json.url game_url(@game)

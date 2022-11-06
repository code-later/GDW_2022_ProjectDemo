class BoardGameGeek::FetchCollectionJob < ApplicationJob
  queue_as :default

  def perform(game_library)
    bgg_service = BoardGameGeek::Service.new

    GameLibrary.transaction(requires_new: true) do
      game_library.games = bgg_service.collection(username: game_library.bgg_username).map do |bgg_game|
        game = Game.find_or_initialize_by(external_id: bgg_game.id)
        game.name = bgg_game.name
        game.picture_url = bgg_game.picture
        game.rating = bgg_game.rating
        game.save

        game
      end
    end

    game_library.update(bgg_sync_completed: true)
  end
end

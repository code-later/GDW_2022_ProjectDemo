class BoardGameGeek::FetchCollectionJob < ApplicationJob
  queue_as :default

  def perform(game_library)
    bgg_service = BoardGameGeek::Service.new

    GameLibrary.transaction(requires_new: true) do
      game_library.games.destroy_all

      bgg_service.collection(username: game_library.bgg_username).each do |bgg_game|
        game_library.games.create(
          name: bgg_game.name,
          external_id: bgg_game.id,
          picture_url: bgg_game.picture,
          rating: bgg_game.rating
        )
      end
    end

    game_library.update(bgg_sync_completed: true)
  end
end

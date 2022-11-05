class GameLibrariesController < ApplicationController
  before_action :set_player

  def show
    @game_library = @player.game_library

    if @game_library
      render :show
    else
      render :not_found, status: :not_found
    end
  end

  def new
    @game_library = @player.build_game_library
  end

  def create
    @game_library = @player.build_game_library(game_library_params)

    respond_to do |format|
      if @game_library.save
        format.html { redirect_to player_game_library_url(player_id: @player), notice: "Ludothek wurde erfolgreich angelegt." }
        format.json { render :show, status: :created, location: @game_library }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_library.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_player
    @player = Player.find(params[:player_id])
  end

  def game_library_params
    params.require(:game_library).permit(:bgg_username)
  end
end

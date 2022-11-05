class GamesController < ApplicationController
  before_action :set_game, only: %i[ show ]

  def show
    if request.headers['X-Embed-Link']
      render :show, layout: false
    else
      render :show
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end

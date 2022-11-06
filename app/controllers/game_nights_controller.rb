class GameNightsController < ApplicationController
  before_action :set_game_night, only: %i[ show edit update destroy ]

  # GET /game_nights or /game_nights.json
  def index
    @game_nights = GameNight.all
  end

  # GET /game_nights/1 or /game_nights/1.json
  def show
  end

  # GET /game_nights/new
  def new
    @game_night = GameNight.new
  end

  # GET /game_nights/1/edit
  def edit
  end

  # POST /game_nights or /game_nights.json
  def create
    @game_night = GameNight.new(game_night_params)

    respond_to do |format|
      if @game_night.save
        format.html { redirect_to game_night_url(@game_night), notice: "Spieleabend wurde erfolgreich angelegt." }
        format.json { render :show, status: :created, location: @game_night }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_night.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_nights/1 or /game_nights/1.json
  def update
    respond_to do |format|
      if @game_night.update(game_night_params)
        format.html { redirect_to game_night_url(@game_night), notice: "Spieleabend wurde erfolgreich gespeichert." }
        format.json { render :show, status: :ok, location: @game_night }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_night.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_nights/1 or /game_nights/1.json
  def destroy
    @game_night.destroy

    respond_to do |format|
      format.html { redirect_to game_nights_url, notice: "Spieleabend wurde erfolgreich gelöscht." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game_night
    @game_night = GameNight.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_night_params
    params.require(:game_night).permit(:title, :takes_place_at)
  end
end

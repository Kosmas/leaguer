# Class that deals with players
class PlayersController < ApplicationController
  before_action :set_team
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players/new
  def new
    @player = @team.players.build
  end

  # POST /players
  def create
    @player = @team.players.build(player_params)
    if @player.save
      flash[:notice] = 'Player has been created.'
      redirect_to [@team, @player]
    else
      flash[:alert] = 'Player has not been created.'
      render 'new'
    end
  end

  # GET /players/1
  def show
  end

  # GET /players/1/edit
  def edit
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      flash[:notice] = 'Player has been updated.'

      redirect_to [@team, @player]
    else
      flash[:alert] = 'Player has not been updated.'

      render 'edit'
    end
  end

  # DELET /players/1
  def destroy
    @player.destroy
    flash[:notice] = 'Player has been deleted.'

    redirect_to @team
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def player_params
    params.require(:player).permit(:first_name, :surname, :dob)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:team_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = @team.players.find(params[:id])
  end
end

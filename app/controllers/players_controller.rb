class PlayersController < ApplicationController
  before_action :set_team
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def new
    @player = @team.players.build
  end

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

  def show
  end

  def edit
  end

  def update
    if @player.update(player_params)
      flash[:notice] = 'Player has been updated.'

      redirect_to [@team, @player]
    else
      flash[:alert] = 'Player has not been updated.'

      render 'edit'
    end
  end

  def destroy
    @player.destroy
    flash[:notice] = 'Player has been deleted.'

    redirect_to @team
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :surname, :dob)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_player
    @player = @team.players.find(params[:id])
  end
end

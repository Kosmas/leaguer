class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      flash[:notice] = "Team has been created."
      redirect_to @team
    else
      flash[:aleert] = "Team has not been created."

      render "new"
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:notice] = "Team has been updated."
      redirect_to @team
    else
      flash[:alert] = "Team has not been updated."
      render "edit"
    end
  end

  private

  def team_params
    params.require(:team).permit(:name,:address1)
  end
end

class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_seasons, only: [:create, :update]

  # GET /teams
  def index
    @teams = Team.all
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # POST /teams
  def create
    @team = Team.new(team_params)
    @team.seasons |= @seasons

    if @team.save
      flash[:notice] = 'Team has been created.'
      redirect_to @team
    else
      flash[:alert] = 'Team has not been created.'

      render 'new'
    end
  end

  # GET /teams/1
  def show
  end

  # GET /teams/1/edit
  def edit
  end

  # PATCH/PUT /teams/1
  def update
    @team.seasons |= @seasons

    if @team.update(team_params)
      flash[:notice] = 'Team has been updated.'
      redirect_to @team
    else
      flash[:alert] = 'Team has not been updated.'
      render 'edit'
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy

    flash[:notice] = 'Team has been deleted.'

    redirect_to teams_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def team_params
    params.require(:team).permit(:name, :address1)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The team you were looking for could not be found.'
    redirect_to teams_path
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_seasons
    @seasons = Season.where(id: params[:seasons])
  end
end

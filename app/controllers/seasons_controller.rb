class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :edit, :update, :destroy]

  # GET /seasons/new
  def new
    @season = Season.new
  end

  # POST /seasons
  def create
    @season = Season.new(season_params)

    if @season.save
      flash[:notice] = 'Season has been created.'
      redirect_to @season
    else
      flash[:alert] = 'Season has not been created.'

      render 'new'
    end
  end

  # PATCH/PUT /seasons/1
  def update
    if @season.update(season_params)
      flash[:notice] = 'Season has been updated.'
      redirect_to @season
    else
      flash[:alert] = 'Season has not been updated.'
      render 'edit'
    end
  end

  # GET /seasons/1/edit
  def edit
  end

  # DELETE /seasons/1
  def destroy
    @season.destroy

    flash[:notice] = 'Season has been deleted.'

    redirect_to seasons_path
  end

  # GET /seasons
  def index
    @seasons = Season.all
  end

  # GET /seasons/1
  def show
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def season_params
    params.require(:season).permit(:description, :current)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_season
    @season = Season.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The season you were looking for could not be found.'
    redirect_to seasons_path
  end
end

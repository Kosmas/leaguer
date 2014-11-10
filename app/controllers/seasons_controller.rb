class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :edit, :update, :destroy]

  def new
    @season = Season.new
  end

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

  def update
    if @season.update(season_params)
      flash[:notice] = 'Season has been updated.'
      redirect_to @season
    else
      flash[:alert] = 'Season has not been updated.'
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @season.destroy

    flash[:notice] = 'Season has been deleted.'

    redirect_to seasons_path
  end

  def index
    @seasons = Season.all
  end

  def show
  end

  private

  def season_params
    params.require(:season).permit(:description, :current)
  end

  def set_season
    @season = Season.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The season you were looking for could not be found.'
    redirect_to seasons_path
  end
end

class SearchesController < ApplicationController

  def show
  end

  def create
    @trains = Search.get_trains(search_params[:start_station_id], search_params[:end_station_id])
    @start_station = RailwayStation.find(search_params[:start_station_id])
    @end_station = RailwayStation.find(search_params[:end_station_id])
    render :show
  end

  private

  def search_params
    params.require(:railway_stations).permit(:start_station_id, :end_station_id)
  end
end

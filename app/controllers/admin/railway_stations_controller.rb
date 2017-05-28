class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station,
                except: [:index, :new, :create]
  before_action :set_route, only: [:update_position, :update_time]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)
      if @railway_station.save
        redirect_to @railway_station, notice: 'Railway station was successfully created.'
      else
        render :new
      end
  end

  def update
      if @railway_station.update(railway_station_params)
        redirect_to @railway_station, notice: 'Railway station was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @railway_station.destroy
      redirect_to railway_stations_url, notice: 'Railway station was successfully destroyed.'
  end

  def update_position
    @route = Route.find(params[:route_id])
    @railway_station.update_position(@route, params[:position])
    redirect_to @route
  end

  def update_arrive
    @route = Route.find(params[:route_id])
    @railway_station.update_arrive(@route, params[:arrive])
    redirect_to @route
  end

  def update_departure
    @route = Route.find(params[:route_id])
    @railway_station.update_departure(@route, params[:departure])
    redirect_to @route
  end

  protected
  def set_route
    @route = Route.find(params[:route_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
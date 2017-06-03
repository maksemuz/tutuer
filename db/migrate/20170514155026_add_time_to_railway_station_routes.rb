class AddTimeToRailwayStationRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :arrive, :datetime, default: '0'
    add_column :railway_stations_routes, :departure, :datetime, default: '0'
  end
end


class AddTimeToRailwayStationRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :arrive, :datetime, default: Time.now
    add_column :railway_stations_routes, :departure, :datetime, default: Time.now
  end
end

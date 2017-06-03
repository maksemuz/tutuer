class AddTimeToRailwayStationRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :arrive, :datetime, default: Time.new(2017)
    add_column :railway_stations_routes, :departure, :datetime, default: Time.new(2017)
  end
end
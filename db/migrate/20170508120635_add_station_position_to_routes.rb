class AddStationPositionToRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :station_position, :integer
  end
end

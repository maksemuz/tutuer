class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :tickets, through: :railway_stations_tickets
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  def update_position(route, position)
    rs_object = self.railway_stations_routes.find_by route_id: route.id
    rs_object.station_position = position
    rs_object.save
  end

  def position(route)
    rs_object = self.railway_stations_routes.find_by route_id: route.id
    rs_object.station_position
  end
end

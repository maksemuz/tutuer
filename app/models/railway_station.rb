class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :tickets, through: :railway_stations_tickets
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  def update_position(route, position)
    railway_stations_routes.any? ?
        railway_stations_routes
            .find_by(route_id: route.id)
            .update(station_position: position) : 'Станция не принадлежит маршруту'
  end

  def position(route)
    railway_stations_routes.any? ?
        railway_stations_routes
            .select(route_id: route.id)
            .station_position : 'Станция не принадлежит маршруту'
  end
end

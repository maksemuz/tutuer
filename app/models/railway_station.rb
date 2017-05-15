class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :tickets, through: :railway_stations_tickets
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").distinct }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_arrive(route, arrive)
    station_route = station_route(route)
    station_route.update(arrive: arrive) if station_route
  end

  def update_departure(route, departure)
    station_route = station_route(route)
    station_route.update(departure: departure) if station_route
  end

  def arrive_at(route)
    station_route(route).try(:arrive)
  end

  def departure_at(route)
    station_route(route).try(:departure)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end

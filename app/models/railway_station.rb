class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :tickets, through: :railway_stations_tickets
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true
end
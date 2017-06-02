class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true

  scope :routes_for, ->(station_kind) {
    joins(:railway_stations)
        .where(railway_stations: { id: station_kind })
  }
end


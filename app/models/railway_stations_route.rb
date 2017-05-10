class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: {scope: :route_id }

  scope :sorted, -> { order(:station_position) }
end
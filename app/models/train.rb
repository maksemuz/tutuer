class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def places(wagon_type, place_type)
    self.wagons.where(type:wagon_type).sum(place_type)
  end

  def sorted
    head_sort ? wagons.sorted_fwd : wagons.sorted_back
  end
end

class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def wagons_logic(kind)
    w = self.wagons.select {|w| w if w.wagon_kind == kind}
    {
      size: w.size,
      upper: w.sum(&:upper_places),
      lower: w.sum(&:lower_places)
    }
  end
end

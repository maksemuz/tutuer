class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def wagons_amount(kind)
    self.wagons.select { |w| w if w.wagon_kind == kind }
  end

  def platzkart
    {size: wagons_amount('Плацкарт').size,
     upper: wagons_amount('Плацкарт').sum(&:upper_places),
     lower: wagons_amount('Плацкарт').sum(&:lower_places)
    }
  end

  def kupe
    {size: wagons_amount('Купе').size,
     upper: wagons_amount('Купе').sum(&:upper_places),
     lower: wagons_amount('Купе').sum(&:lower_places)
    }
  end
end

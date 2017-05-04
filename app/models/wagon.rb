class Wagon < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validates :upper_places, numericality: { greater_than: 17, less_than: 28 }
  validates :lower_places, numericality: { greater_than: 17, less_than: 28 }
end

class Coupe < Wagon
  validates :upper_places, :lower_places, presence: true
end

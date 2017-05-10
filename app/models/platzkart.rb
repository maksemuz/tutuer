class Platzkart < Wagon
  validates :upper_places, :lower_places, :side_upper_places, :side_lower_places, presence: true
end

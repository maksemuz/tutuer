class Search
  def self.get_trains(start_station, end_station)
    unless start_station == end_station
      routes = Route
                   .joins(:railway_stations)
                   .where(railway_stations: { id: start_station }) &
          Route
              .joins(:railway_stations)
              .where(railway_stations: { id: end_station })
      Train.joins(:route).where(route: routes)
    end
  end
end


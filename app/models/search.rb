class Search

  def self.get_trains(start_station, end_station)
    unless start_station == end_station
      routes = Route.routes_for(start_station) & Route.routes_for(end_station)
      Train.joins(:route).where(route: routes)
    end
  end
end


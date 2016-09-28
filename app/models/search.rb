class Search < ApplicationRecord

  def self.search_trains(first_station, last_station)
    routes = Route.joins(:railway_stations).where(railway_stations: { id: first_station }) &
             Route.joins(:railway_stations).where(railway_stations: { id: last_station })
    @trains = Train.joins(:route).where(route: routes)
  end
end

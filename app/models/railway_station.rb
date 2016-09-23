class RailwayStation < ApplicationRecord
  has_many :train
  has_many :departure_tickets, class_name: 'Ticket', foreign_key: :first_station_id
  has_many :destination_tickets, class_name: 'Ticket', foreign_key: :last_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { order("railway_stations_routes.position") }

  def set_position(route, position)
    st_route = get_station_route(route)
    st_route.position = position
    st_route.save
  end

  def position(route)
    st_route = get_station_route(route)
    st_route.position
  end

  private

  def get_station_route(route)
    self.railway_stations_routes.where(route_id: route).first
  end
end

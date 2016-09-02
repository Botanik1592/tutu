class RailwayStation < ApplicationRecord
  has_many :train
  has_many :departure_tickets, class_name: 'Ticket', foreign_key: :first_station_id
  has_many :destination_tickets, class_name: 'Ticket', foreign_key: :last_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true
end

class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :trains
  has_many :railway_stations, through: :railway_stations_routes

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Маршрут должен содержать минимум 2 станции.")
    end
  end
end

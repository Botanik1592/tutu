class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def show_wagons(train, type)
    wagons = []

    self.wagons.each do |wagon|
      wagons << wagon if wagon.wagon_type.wagon_type == type
    end
    wagons.size
  end

  def show_places(wagon_type, places_type)
    self.wagons.where(type: wagon_type).sum(places_type)
  end

  def wagons_order
    self.head ? wagons.ordered.reverse : wagons.ordered
  end

end

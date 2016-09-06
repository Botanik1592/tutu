class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def show_wagons(train, type)
    wagons = []

    train.wagons.each do |wagon|
      wagons << wagon if wagon.wagon_type.wagon_type == type
    end
    wagons.size
  end

  def show_places(wagons, type, places)
    count = 0
    if places == "top"
      wagons.each do |wagon|
        count = count + wagon.top_places if wagon.wagon_type.wagon_type == type
      end
    else
      wagons.each do |wagon|
        count = count + wagon.lower_places if wagon.wagon_type.wagon_type == type
      end
    end
    count
  end
end

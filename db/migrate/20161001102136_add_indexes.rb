class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :railway_stations_routes, [:railway_station_id, :route_id], unique: true, name: "rsr"
    add_index :wagons, [:id, :type]
    add_index :wagon_types, :wagon_type
  end
end

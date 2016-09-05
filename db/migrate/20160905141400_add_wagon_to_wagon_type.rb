class AddWagonToWagonType < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :wagons, :wagon_type
  end
end

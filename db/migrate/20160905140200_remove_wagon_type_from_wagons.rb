class RemoveWagonTypeFromWagons < ActiveRecord::Migration[5.0]
  def change
    remove_column :wagons, :wagon_type
  end
end

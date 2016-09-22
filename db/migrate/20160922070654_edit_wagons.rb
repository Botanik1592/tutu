class EditWagons < ActiveRecord::Migration[5.0]
  def change
    remove_column :wagons, :wagon_type
    add_column :wagons, :side_top_places, :integer
    add_column :wagons, :side_lower_places, :integer
    add_column :wagons, :seats, :integer
    add_column :wagons, :type, :string
  end
end

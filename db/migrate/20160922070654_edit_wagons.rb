class EditWagons < ActiveRecord::Migration[5.0]
  def change

    add_column :wagons, :side_top_places, :integer
    add_column :wagons, :side_lower_places, :integer
    add_column :wagons, :seats, :integer
    add_column :wagons, :type, :string
  end
end

class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.integer :number
      t.integer :top_places
      t.integer :lower_places
      t.string :wagon_type

      t.timestamps
    end
  end
end

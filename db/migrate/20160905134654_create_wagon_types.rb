class CreateWagonTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :wagon_types do |t|
      t.string :wagon_type

      t.timestamps
    end
  end
end

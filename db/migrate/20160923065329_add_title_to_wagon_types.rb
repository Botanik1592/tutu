class AddTitleToWagonTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :wagon_types, :title, :string
  end
end

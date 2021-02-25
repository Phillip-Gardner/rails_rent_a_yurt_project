class AddCoordinatesToYurts < ActiveRecord::Migration[6.0]
  def change
    add_column :yurts, :latitude, :float
    add_column :yurts, :longitude, :float
  end
end

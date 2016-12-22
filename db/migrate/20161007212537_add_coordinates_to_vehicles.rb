class AddCoordinatesToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :origin_latitude, :float
    add_column :vehicles, :origin_longitude, :float
    add_column :vehicles, :destination_latitude, :float
    add_column :vehicles, :destination_longitude, :float
  end
end

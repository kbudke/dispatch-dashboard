class AddTruckIdToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :truckId, :string
  end
end

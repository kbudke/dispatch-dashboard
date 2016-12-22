class ChangeTruckIdInVehicle < ActiveRecord::Migration[5.0]
  def change
  	rename_column :vehicles, :truckId, :truck_id
  end
end

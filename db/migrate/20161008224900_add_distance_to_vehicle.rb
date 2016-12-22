class AddDistanceToVehicle < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :distance, :float
  end
end

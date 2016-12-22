class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :make
      t.string :model
      t.integer :yearManufactured
      t.string :origin
      t.string :destination
      t.string :vinNumber
      t.float :minimumPossibleWeight
      t.float :maximumPossibleWeight
      t.float :actualWeight

      t.timestamps
    end
  end
end

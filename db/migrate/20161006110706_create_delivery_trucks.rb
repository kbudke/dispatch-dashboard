class CreateDeliveryTrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_trucks do |t|
      t.string :name
      t.float :minimumPossibleWeight
      t.float :maximumPossibleWeight
      t.string :vinNumber
      t.string :origin
      t.string :destination
      t.integer :yearManufactured
      t.string :make
      t.string :model
      t.float :payloadEmptyWeight
      t.string :originLocation
      t.string :currentLocation
      t.string :destinationLocation
      t.string :weightCapacity
      t.integer :yearAquired
      t.text :carFax
      t.text :maintenanceHistory
      t.text :nextMaintenance
      t.float :highwayMPG
      t.float :cityMPG
      t.float :avgMPG
      t.string :scheduledDepartureTime
      t.string :estimatedArrivalTime
      t.string :requestedArrivalTime

      t.timestamps
    end
  end
end

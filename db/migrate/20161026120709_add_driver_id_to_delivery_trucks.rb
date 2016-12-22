class AddDriverIdToDeliveryTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :delivery_trucks, :driverId, :string
  end
end

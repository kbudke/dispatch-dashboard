class AddOccupiedSlotsToDeliveryTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :delivery_trucks, :occupied_slots, :integer
  end
end

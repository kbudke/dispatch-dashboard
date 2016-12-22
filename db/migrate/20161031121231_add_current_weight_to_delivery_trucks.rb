class AddCurrentWeightToDeliveryTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :delivery_trucks, :currentWeight, :integer
  end
end

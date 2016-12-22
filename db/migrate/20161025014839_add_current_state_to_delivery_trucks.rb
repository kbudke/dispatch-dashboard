class AddCurrentStateToDeliveryTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :delivery_trucks, :currentState, :string
  end
end

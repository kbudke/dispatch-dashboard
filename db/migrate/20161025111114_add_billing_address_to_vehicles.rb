class AddBillingAddressToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :billingAddress, :string
  end
end

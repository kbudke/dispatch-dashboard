class AddCustomerNameToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :customername, :string
  end
end

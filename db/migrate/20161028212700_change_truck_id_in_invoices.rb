class ChangeTruckIdInInvoices < ActiveRecord::Migration[5.0]
  def change
  	rename_column :invoices, :truckId, :truck_id
  end
end

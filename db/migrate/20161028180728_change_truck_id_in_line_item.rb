class ChangeTruckIdInLineItem < ActiveRecord::Migration[5.0]
  def change
  	rename_column :line_items, :truckId, :truck_id
  end
end

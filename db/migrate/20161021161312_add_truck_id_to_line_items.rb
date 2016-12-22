class AddTruckIdToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :truckId, :integer
  end
end

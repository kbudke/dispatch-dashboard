class AddStartTimeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :start_time, :datetime
  end
end

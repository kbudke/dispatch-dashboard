class AddCurrentStateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :currentState, :string
  end
end

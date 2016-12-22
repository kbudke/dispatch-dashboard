class AddCurrentStateToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :currentState, :string
  end
end

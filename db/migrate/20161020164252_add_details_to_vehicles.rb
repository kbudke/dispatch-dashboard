class AddDetailsToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :details, :text
  end
end

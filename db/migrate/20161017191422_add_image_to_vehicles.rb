class AddImageToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :image, :string
  end
end

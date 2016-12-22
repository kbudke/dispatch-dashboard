class AddImageToDrivers < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :image, :string
  end
end

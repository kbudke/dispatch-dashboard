class AddRemoteImageUrlToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :remote_image_url, :string
  end
end

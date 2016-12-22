class AddUserIdToDeliveryTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :delivery_trucks, :user_id, :integer
  end
end

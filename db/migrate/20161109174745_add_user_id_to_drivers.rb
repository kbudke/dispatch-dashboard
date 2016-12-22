class AddUserIdToDrivers < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :user_id, :integer
  end
end

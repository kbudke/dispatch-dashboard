class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :driver_name
      t.string :driver_id
      t.string :driver_dob
      t.text :driver_address
      t.string :email
      t.integer :phone_number
      t.integer :trailer_capacity

      t.timestamps
    end
  end
end

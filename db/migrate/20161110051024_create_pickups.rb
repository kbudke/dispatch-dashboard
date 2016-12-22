class CreatePickups < ActiveRecord::Migration[5.0]
  def change
    create_table :pickups do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end

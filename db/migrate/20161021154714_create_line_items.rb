class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :vehicle_id
      t.decimal :bid_total
      t.integer :order_id
      t.string :dispatch_date

      t.timestamps
    end
  end
end

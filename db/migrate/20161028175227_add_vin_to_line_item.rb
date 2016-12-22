class AddVinToLineItem < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :vin, :string
  end
end

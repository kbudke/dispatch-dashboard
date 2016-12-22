class AddDestinationToLineItem < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :destination, :string
  end
end

class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.string :client
      t.integer :truckId
      t.integer :userId
      t.decimal :total
      t.text :invoice_items
      t.string :dispatchdate

      t.timestamps
    end
  end
end

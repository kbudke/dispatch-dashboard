class AddCompanyBillingAddressToLineItem < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :company_billing_address, :string
  end
end

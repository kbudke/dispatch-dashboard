class AddCompanyNameToLineItem < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :company_name, :string
  end
end

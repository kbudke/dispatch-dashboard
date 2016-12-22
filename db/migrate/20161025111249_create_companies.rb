class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :companyName
      t.string :companyAddress
      t.string :companyBillingAddress
      t.string :companyCustomId

      t.timestamps
    end
  end
end

class ChangeDataTypeOfDriversPhoneNumber < ActiveRecord::Migration[5.0]
  def change
  	change_column :drivers, :phone_number, :string
  end
end

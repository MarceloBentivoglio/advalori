class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :invoice_payers, :adress_number, :address_number
  end
end

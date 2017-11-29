class ChangeStatusDefaulToInvoice < ActiveRecord::Migration[5.0]
  def up
    change_column_default :invoices, :status, "Not Available"
  end

   def down
    change_column_default :invoices, :status, "Available"
  end
end

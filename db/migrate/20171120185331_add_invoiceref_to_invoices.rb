class AddInvoicerefToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoices, :invoice_payer, foreign_key: true
  end
end

class AddxmfilelToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_attachment :invoices, :xml_file
  end
end

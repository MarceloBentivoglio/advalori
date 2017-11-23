class AddSellerToInvoicePayer < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoice_payers, :seller, foreign_key: true
  end
end

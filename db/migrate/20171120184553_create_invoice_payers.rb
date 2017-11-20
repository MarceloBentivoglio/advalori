class CreateInvoicePayers < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_payers do |t|
      t.string :cnpj
      t.string :name
      t.string :address
      t.string :adress_number
      t.string :address_complement
      t.string :phone_number
      t.string :state
      t.string :zip_code
      t.string :neighborhood
      t.string :city

      t.timestamps
    end
  end
end

class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.string :number
      t.float :total_value
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end

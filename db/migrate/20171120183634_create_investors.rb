class CreateInvestors < ActiveRecord::Migration[5.0]
  def change
    create_table :investors do |t|
      t.string :cnpj
      t.string :name
      t.string :address
      t.string :address_number
      t.string :address_complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end

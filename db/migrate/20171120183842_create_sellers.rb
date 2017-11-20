class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.string :cnpj
      t.string :name
      t.string :address
      t.string :address_number
      t.string :city
      t.string :neighborhood
      t.string :zip_code
      t.string :state
      t.integer :number_of_employees
      t.string :phone_number
      t.string :address_complement

      t.timestamps
    end
  end
end

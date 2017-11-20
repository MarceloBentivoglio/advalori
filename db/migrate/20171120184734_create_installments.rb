class CreateInstallments < ActiveRecord::Migration[5.0]
  def change
    create_table :installments do |t|
      t.string :number
      t.float :value
      t.date :due_date
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end

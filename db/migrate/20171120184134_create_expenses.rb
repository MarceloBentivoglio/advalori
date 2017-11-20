class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :supplier
      t.float :value
      t.datetime :due_date
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end

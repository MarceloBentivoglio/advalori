class AddFeeToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :fee, :float
  end
end

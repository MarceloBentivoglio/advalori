class AddSellerToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :seller, :boolean, default: true
  end
end

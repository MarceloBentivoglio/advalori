class RenameSellerToIsSellerFromUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :seller, :is_seller
  end
end

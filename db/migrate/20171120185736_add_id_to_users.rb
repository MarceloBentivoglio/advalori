class AddIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :seller, foreign_key: true
    add_reference :users, :investor, foreign_key: true
  end
end

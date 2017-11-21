class Seller < ApplicationRecord
  has_many :users
  has_many :invoices
  has_many :expenses
end

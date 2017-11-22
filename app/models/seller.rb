class Seller < ApplicationRecord
  has_many :users
  has_many :invoices
  has_many :expenses

  validates :cnpj, :name, :address, :address_number, :city, :neighborhood, :zip_code, :state, :number_of_employees, :phone_number, presence: true
end

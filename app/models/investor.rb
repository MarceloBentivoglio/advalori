class Investor < ApplicationRecord
  has_many :users
  has_many :orders

  validates :cnpj, :name, :address, :address_number, :city, :neighborhood, :zip_code, :state, :phone_number, presence: true
end

class InvoicePayer < ApplicationRecord
  has_many :invoices

  validates :cnpj, :name, :address, :address_number, :city, :neighborhood, :zip_code, :state, :phone_number, presence: true
end

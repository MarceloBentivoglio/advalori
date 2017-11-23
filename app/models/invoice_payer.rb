class InvoicePayer < ApplicationRecord
  has_many :invoices
  belongs_to :seller

  validates :cnpj, :name, :address, :address_number, :city, :neighborhood, :zip_code, :state, :phone_number, presence: true
end

class Order < ApplicationRecord
  belongs_to :invoice
  belongs_to :investor

  validates :investor_id, :invoice_id, presence: true
end

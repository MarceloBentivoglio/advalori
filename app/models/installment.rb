class Installment < ApplicationRecord
  belongs_to :invoice

  validates :number, :value, :due_date, :invoice_id, presence: true
end

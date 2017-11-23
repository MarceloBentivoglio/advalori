class Installment < ApplicationRecord
  belongs_to :invoice

  validates :number, :value, :due_date, :invoice, presence: true
end

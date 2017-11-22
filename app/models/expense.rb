class Expense < ApplicationRecord
  belongs_to :seller

  validates :supplier, :value, :due_date, :seller_id, presence: true
end

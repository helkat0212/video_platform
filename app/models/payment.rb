class Payment < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :date, presence: true
  validates :status, presence: true

  belongs_to :user
end


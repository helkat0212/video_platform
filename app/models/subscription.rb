class Subscription < ApplicationRecord
  validates :startDate, presence: true
  validates :endDate, presence: true

  belongs_to :user
  belongs_to :channel
end

class Channel < ApplicationRecord
  validates :channelName, presence: true, uniqueness: true
  validates :description, presence: true
  validates :createDate, presence: true

  has_many :subscriptions
end

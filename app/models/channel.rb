class Channel < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creatorId', inverse_of: :channels
  validates :channelName, presence: true
  validates :description, presence: true
  validates :createDate, presence: true
  has_many :subscriptions, dependent: :destroy
end

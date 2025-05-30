class Video < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, format: { with: /\A#{URI::regexp(['http', 'https'])}\z/, message: "must be a valid URL" }

  belongs_to :user
  has_many :comments, dependent: :destroy
end

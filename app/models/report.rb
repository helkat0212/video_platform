class Report < ApplicationRecord
  validates :reportType, presence: true
  validates :generatedDate, presence: true
  validates :content, presence: true

  belongs_to :user
end

class Comment < ApplicationRecord
  validates :text, presence: true
  validates :datePosted, presence: true

  belongs_to :user
  belongs_to :video
end



class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :userName, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
    # Associations
  has_many :videos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :channels, through: :subscriptions
  has_many :channels, foreign_key: 'creatorId', inverse_of: :creator, dependent: :destroy
  
  def subscribed_to?(channel)
    channels.include?(channel)

    has_many :payments, dependent: :destroy
    has_many :reports, dependent: :destroy

# Devise gem will automatically include this if your using 'devise' gem, but it's worth checking

    attr_accessor :password

  # this method is likely missing 

    def encrypted_password=(password)

      self[:encrypted_password] = Devise.password_hash(password) 

    end
  end
end

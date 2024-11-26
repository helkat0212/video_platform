class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Валідації для поля userName
  validates :userName, presence: true, uniqueness: true

  # Валідації для поля email
  validates :email, presence: true, uniqueness: true

  # Валідації для пароля
  validates :password, presence: true, length: { minimum: 6 }

  # Асоціації з іншими моделями
  has_many :videos
  has_many :comments
  has_many :subscriptions
  has_many :channels, through: :subscriptions

  def subscribed_to?(channel)
    channels.include?(channel)
  end
  has_many :payments
  has_many :reports

# Devise gem will automatically include this if your using 'devise' gem, but it's worth checking

  attr_accessor :password

  # this method is likely missing 

  def encrypted_password=(password)

    self[:encrypted_password] = Devise.password_hash(password) 

  end

end

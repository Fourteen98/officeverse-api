class User < ApplicationRecord
  has_many :offices

  has_many :reservations
  has_many :offices, through: :reservations

  validates :first_name, presence: true,
                         length: { maximum: 18, too_long: '%<count>s characters is the maximum allowed' }
  validates :last_name, presence: true, length: { maximum: 18, too_long: '%<count>s characters is the maximum allowed' }
  validates :username, presence: true, uniqueness: true,
                       length: { maximum: 18, too_long: 'is too long (maximum is 18 characters)' }
end

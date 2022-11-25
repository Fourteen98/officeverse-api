class User < ApplicationRecord
  validates :first_name, presence: true, uniqueness: true,
                         length: { maximum: 18, too_long: '%<count>s characters is the maximum allowed' }
  validates :last_name, presence: true, uniqueness: true,
                        length: { maximum: 18, too_long: '%<count>s characters is the maximum allowed' }
  validates :username, presence: true, uniqueness: true,
                       length: { maximum: 18, too_long: '%<count>s characters is the maximum allowed' }
end

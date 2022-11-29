class Service < ApplicationRecord
  has_and_belongs_to_many :reservations

  validates :name, presence: true,
                   length: { maximum: 18, too_long: '%<count>s characters is the maximum allowed' }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

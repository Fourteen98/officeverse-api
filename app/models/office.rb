class Office < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :area, presence: true
  validates :occupancy, presence: true, numericality: { only_integer: true }
  validates :images, presence: true
  validates :basic_price, presence: true, numericality: true
  validates :address, presence: true
end

class Office < ApplicationRecord
  belongs_to :user

  has_many :reservations
  has_many :users, through: :reservations

  validates :title, presence: true
  validates :description, presence: true
  validates :area, presence: true
  validates :occupancy, presence: true, numericality: { only_integer: true }
  validates :basic_price, presence: true, numericality: true
  validates :address, presence: true
end

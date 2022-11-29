class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :office
  has_and_belongs_to_many :services
  has_and_belongs_to_many :peripherals
end

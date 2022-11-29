require 'rails_helper'

require_relative '../../app/models/office'

RSpec.describe Office, type: :model do
  # it { should have_many(:reservations) }

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:basic_price) }

  it { should validate_numericality_of(:basic_price) }
end

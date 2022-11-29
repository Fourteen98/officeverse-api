require 'rails_helper'

Rspec.describe Service, type: :model do 
  subject do 
    Service.new(name: 'Test', description: 'Test', price: 10)
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      Subject.name = nil 
      expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
      Subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'name maximum length is 18 characters' do
      expect(subject.name.length).to be <= 18
    end

    it 'price must be greater than or equal to 0' do
      expect(subject.price).to be >= 0
    end
  end
end
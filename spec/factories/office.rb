FactoryBot.define do
  factory :office do
    title { Faker::Lorem.words(number: 1) }
    description { Faker::Lorem.sentence }
    area { Faker::Lorem.words(number: 1) }
    occupancy { Faker::Number.number(digits: 1) }
    images { Faker::LoremFlickr.image(size: '50x50', search_terms: ['office']) }
    basic_price { Faker::Number.decimal(l_digits: 2) }
    address { Faker::Address.full_address }
  end
end

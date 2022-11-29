# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

9.times do
  User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, username: Faker::Name.middle_name)
end

9.times do
  Service.create(name: Faker::Lorem.words(number: 1) , description: Faker::Lorem.sentence, price: Faker::Number.decimal(l_digits: 2))
end

9.times do 
  Office.create(title: Faker::Lorem.words(number: 1), description: Faker::Lorem.sentence, area: Faker::Lorem.words(number: 1), occupancy: Faker::Number.number(digits: 1), images: Faker::LoremFlickr.image(size: "50x50", search_terms: ['office']), basic_price: Faker::Number.decimal(l_digits: 2), address: Faker::Address.full_address, user_id: 1)
end

9.times do 
  Peripheral.create(name: Faker::Lorem.words(number: 1), description: Faker::Lorem.sentence, price: Faker::Number.decimal(l_digits: 2))
end

p 'Created 9 users'
p 'Created 9 services'
p 'Created 9 offices'
p 'Created 9 peripherals'
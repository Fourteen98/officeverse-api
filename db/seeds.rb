# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

9.times do
  User.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, username: Faker::Internet.username, email: Faker::Internet.email, password: 'password')
  Service.create!(name: Faker::Lorem.word, description: Faker::Lorem.sentence, price: Faker::Number.decimal(l_digits: 2))
  Peripheral.create!(name: Faker::Appliance.equipment, description: Faker::Lorem.sentence, price: Faker::Number.decimal(l_digits: 2))
end

9.times do |office|
  Office.create!(title: Faker::Lorem.word, description: Faker::Lorem.sentence,
                area: rand(1...72), occupancy: rand(1...9),
                images: [Faker::LoremFlickr.image(size: "400x300", search_terms: ['office']), Faker::LoremFlickr.image(size: "400x300", search_terms: ['offices'])], basic_price: Faker::Number.decimal(l_digits: 2), address: Faker::Address.full_address, user_id: office+1)
end

9.times do |reservation|
  Reservation.create!(start_date: Faker::Date.between(from: 4.days.ago, to: 2.days.ago), end_date: Faker::Date.between(from: 1.days.ago, to: Date.today), peripherals: [], services: [], user_id: reservation+1, office_id: reservation+1)
end

p 'Created 9 users'
p 'Created 9 services'
p 'Created 9 offices'
p 'Created 9 peripherals'
p 'Created 9 reservations'
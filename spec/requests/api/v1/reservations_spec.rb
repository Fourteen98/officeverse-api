require 'swagger_helper'

RSpec.describe 'api/v1/user_id:/reservations', type: :request do
  describe 'POST /user_id:/reservations' do
    let(:user) do
      User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username,
                  email: Faker::Internet.email, password: 'password')
    end
    path '/user_id:/reservations' do
      let(:user_id) do
        User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username,
                    email: Faker::Internet.email, password: 'password').id
      end
      let(:office_id) do
        Office.create(title: Faker::Lorem.word, description: Faker::Lorem.sentence,
                      area: rand(1...72), occupancy: rand(1...9),
                      images: [Faker::LoremFlickr.image(size: '400x300', search_terms: ['office']),
                               Faker::LoremFlickr.image(size: '400x300', search_terms: ['offices'])],
                      basic_price: Faker::Number.decimal(l_digits: 2), address: Faker::Address.full_address, user_id: :user_id).id
      end
      post 'Creates a reservation' do
        tags 'Reservation'
        consumes 'application/json'
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            start_date: { type: :string, format: :date },
            end_date: { type: :string, format: :date },
            user_id: { type: :number },
            office_id: { type: :number }
          },
          required: %w[start_date end_date user_id office_id]
        }
        response '201', 'reservation created' do
          let(:reservation) do
            Reservation.create(start_date: Faker::Date.between(from: 4.days.ago, to: 2.days.ago),
                               end_date: Faker::Date.between(from: 1.days.ago, to: Date.today), peripherals: [],
                               services: [], user_id: :user_id, office_id: :office_id)
          end
          run_test!
        end
      end
    end
    path '/user_id:/reservations' do
      get "Retrieves user's reservations" do
        tags 'Reservations'
        produces 'application/json'

        response '200', 'successful' do
          run_test!
        end
      end
    end
  end
end

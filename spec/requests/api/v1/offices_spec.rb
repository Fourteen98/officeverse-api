require 'swagger_helper'

RSpec.describe 'api/v1/offices', type: :request do
    describe 'POST /offices/:id' do

        path 'POST /offices/:id' do
        

        post 'Creates an office' do
            tags 'Offices'
            consumes 'application/json'
            parameter name: :office, in: :body, schema: {
              type: :object,
              properties: {
                title: { type: :string },
                description: { type: :string }
                area: { type: :string }
                occupancy: { type: :integer }
                images: { type: :string }
                basic_price: { type: :decimal }
                address: { type: :string }
              },
              required: [ 'title', 'description', 'area', 'occupancy', 'images', 'basic_price', 'address' ]
            }
            response '201', 'blog created' do
                let(:valid_attributes) do
                    { title: 'Test1', description: 'This is a test office',
                      area: 'One square meter', images: Faker::LoremFlickr.image(size: '50x50', search_terms: ['office']),
                      occupancy: 5, basic_price: 30.2, address: Faker::Address.full_address }
                  end
                run_test!
            end
        end
    end
end

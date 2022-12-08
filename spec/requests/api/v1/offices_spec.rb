require "swagger_helper"

RSpec.describe "api/v1/offices", type: :request do
  describe "POST /offices/:id" do
    let(:user) { User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username, email: Faker::Internet.email, password: "password") }
    path "/offices" do
      let(:user1) { User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username, email: Faker::Internet.email, password: "password") }

      post "Creates an office" do
        tags "Offices"
        consumes "application/json"
        parameter name: :office, in: :body, schema: {
                    type: :object,
                    properties: {
                      title: { type: :string },
                      description: { type: :string },
                      area: { type: :string },
                      occupancy: { type: :number },
                      images: { type: :string },
                      basic_price: { type: :number },
                      address: { type: :string },
                      user_id: { type: :number },
                    },
                    required: ["title", "description", "area", "occupancy", "images", "basic_price", "address"],
                  }
        response "201", "office created" do
          let(:office) do
            { title: "test office", description: "This is a test office",
              area: "One square meter", images: Faker::LoremFlickr.image(size: "50x50", search_terms: ["office"]),
              occupancy: 5, basic_price: 30.2, address: Faker::Address.full_address, user: :user }
          end
          run_test!
        end
      end
    end
    path "/offices" do
      get "Retrieves all offices list" do
        tags "Offices"
        produces "application/json"

        response "200", "successful" do
          run_test!
        end
      end
    end
  end
end

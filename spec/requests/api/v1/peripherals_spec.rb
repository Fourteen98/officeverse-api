require "swagger_helper"

RSpec.describe "api/v1/peripherals", type: :request do
  describe "POST /peripherals" do
    path "/peripherals" do
      post "Creates a peripheral" do
        tags "Peripherals"
        consumes "application/json"
        parameter name: :peripheral, in: :body, schema: {
                    type: :object,
                    properties: {
                      name: { type: :string },
                      description: { type: :string },
                      price: { type: :number },
                    },
                    required: ["name"],
                  }
        response "201", "peripheral created" do
          let(:peripheral) do
            { name: "test peripheral", description: "This is a test peripheral", price: 1 }
          end
          run_test!
        end
      end
    end
    path "/peripherals" do
      get "Retrieves all peripherals list" do
        tags "Peripherals"
        produces "application/json"

        response "200", "successful" do
          run_test!
        end
      end
    end
  end
end

require "swagger_helper"

RSpec.describe "api/v1/offices", type: :request do
  describe "POST /offices/:id" do
    path "/services" do
      post "Creates a service" do
        tags "Services"
        consumes "application/json"
        parameter name: :service, in: :body, schema: {
                    type: :object,
                    properties: {
                      name: { type: :string },
                      description: { type: :string },
                      price: { type: :number },
                    },
                    required: ["name"],
                  }
        response "201", "service created" do
          let(:service) do
            { name: "test service", description: "This is a test service", price: 1 }
          end
          run_test!
        end
      end
    end
    path "/services" do
      get "Retrieves all services list" do
        tags "Services"
        produces "application/json"

        response "200", "successful" do
          run_test!
        end
      end
    end
  end
end

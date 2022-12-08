require 'rails_helper'

RSpec.describe 'Services', type: :request do
  context 'Services actions' do
    it 'returns a list of services' do
      get '/api/v1/services'
      expect(response).to have_http_status(:success)
    end

    #it 'returns a service' do
    #  service = Service.create(name: 'Test', description: 'Test', price: 10)
    #  get "/api/v1/services/#{service.id}"
    #  expect(response).to have_http_status(:success)
    #end

    it 'creates a service' do
      get '/api/v1/services', params: { service: { name: 'Test', description: 'Test', price: 10 } }
      expect(response).to have_http_status(:success)
    end

    it 'deletes a service' do
      service = Service.create(name: 'Test', description: 'Test', price: 10)
      delete "/api/v1/services/#{service.id}"
      expect(response).to have_http_status(:success)
    end
  end
end

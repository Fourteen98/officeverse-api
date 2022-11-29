RSpec.describe 'Officess', type: :request do
  # initialize test data
  let!(:offices) { create_list(:office, 5) }
  let(:office_id) { offices.first.id }

  describe 'GET /offices' do
    before { get '/api/v1/offices' }
    it 'returns offices' do
      expect(response.body).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /offices/:id' do
    before { get "/api/v1/offices/#{office_id}" }
    context 'when office exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns the book item' do
        expect(JSON.parse(response.body)['id']).to eq(office_id)
      end
    end
    context 'when book does not exist' do
      let(:office_id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find office with 'id'=0")
      end
    end
  end

  describe 'POST /offices/:id' do
    let(:valid_attributes) do
      { title: 'Test1', description: 'This is a test office',
        area: 'One square meter', images: Faker::LoremFlickr.image(size: '50x50', search_terms: ['office']),
        occupancy: 5, basic_price: 30.2, address: Faker::Address.full_address }
    end
    context 'when request attributes are valid' do
      before { post '/api/v1/offices', params: { office: valid_attributes } }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'when an invalid request' do
      before { post '/api/v1/offices', params: { office: {} } }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a failure message' do
        expect(response.body).to include('value is empty')
      end
    end
  end

  describe 'DELETE /offices/:id' do
    before { delete "/api/v1/offices/#{office_id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

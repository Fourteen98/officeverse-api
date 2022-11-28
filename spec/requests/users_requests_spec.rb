RSpec.describe 'Users', type: :request do
  # initialize test data
  let!(:users) { create_list(:user, 5) }

  describe 'GET /users' do
    before { get '/api/v1/users' }
    it 'returns users' do
      # binding.b
      expect(response.body).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end
end

require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /foods/new' do
    it 'returns http success' do
      get '/foods/new'
      expect(response).to have_http_status(:success)
    end
  end
end

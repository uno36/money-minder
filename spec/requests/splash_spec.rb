require 'rails_helper'

RSpec.describe 'SplashController', type: :request do
  describe 'GET /' do
    it 'responds with a 200 OK status code' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
  end
end

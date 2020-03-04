require 'rails_helper'

RSpec.describe 'Admin::Users', type: :request do
  let(:admin) { create(:user, :admin) }

  before { sign_in(admin) }

  describe 'GET /index' do
    it 'returns http success' do
      get admin_users_path
      expect(response).to have_http_status(:success)
    end
  end
end

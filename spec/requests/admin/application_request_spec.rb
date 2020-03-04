require 'rails_helper'

RSpec.describe 'Admin::Applications', type: :request do
  describe 'GET /index' do
    context 'when user is not an admin' do
      let(:user) { create(:user) }

      before do
        allow_any_instance_of(Admin::ApplicationController).to receive(:authenticate_user!)
        allow_any_instance_of(Admin::ApplicationController).to receive(:current_user).and_return(user)
      end

      it 'cannot access the index action' do
        get admin_root_path
        expect(response).to redirect_to('/')
        expect(flash[:alert]).to eq('You are not authorized to view this page')
      end
    end

    context 'when user is an admin' do
      let(:admin) { create(:user, :admin) }

      before do
        allow_any_instance_of(Admin::ApplicationController).to receive(:authenticate_user!)
        allow_any_instance_of(Admin::ApplicationController).to receive(:current_user).and_return(admin)
      end

      it 'returns http success' do
        get admin_root_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end

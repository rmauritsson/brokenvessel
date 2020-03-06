require 'rails_helper'

RSpec.describe 'Applications', type: :system do
  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }

  context 'when logged in as an admin' do
    before do
      sign_in(admin)
      visit('/')
    end

    it 'can see the view admin portal link' do
      expect(page).to have_content('View Admin Portal')
    end
  end

  context 'when logged in as a regular user' do
    before do
      sign_in(user)
      visit('/')
    end

    it 'cannot view the admin portal link' do
      expect(page).not_to have_content('View Admin Portal')
    end
  end

  context 'when i am anonymous' do
    it 'cannot view the admin portal link' do
      visit('/')
      expect(page).not_to have_content('View Admin Portal')
    end
  end
end

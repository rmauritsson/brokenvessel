require 'rails_helper'

RSpec.describe 'Admin::CreateUsers', type: :system do
  let(:admin) { create(:user, :admin) }

  before do
    sign_in(admin)

    visit '/'
  end

  context 'when logged in as an admin' do
    it 'can create an admin user' do
      click_link 'View Admin Portal'
      expect(page).to have_text('All Users')

      click_link 'Create New User'
      fill_in 'Full Name', with: 'Test Admin'
      fill_in 'Username', with: 'admin'
      fill_in 'Email', with: 'admin@example.com'
      fill_in 'Phone Number', with: '1234089345'
      fill_in 'Password', with: 'password'
      check 'user_admin'

      click_button 'Create User'

      expect(page).to have_text('User has been created')
      expect(page).to have_text('Test Admin')
    end

    it 'can create a listener' do
      click_link 'View Admin Portal'
      expect(page).to have_text('All Users')

      click_link 'Create New User'
      fill_in 'Full Name', with: 'First Listener'
      fill_in 'Username', with: 'listener'
      fill_in 'Email', with: 'listener@example.com'
      fill_in 'Phone Number', with: '1230456789'
      fill_in 'Password', with: 'password'
      check 'user_listener'

      click_button 'Create User'

      expect(page).to have_text('User has been created')
      expect(page).to have_text('First Listener')
    end
  end
end

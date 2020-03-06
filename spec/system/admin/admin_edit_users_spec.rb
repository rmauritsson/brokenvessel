require 'rails_helper'

RSpec.describe 'Admin::EditUsers', type: :system do
  let(:admin) { create(:user, :admin) }
  let!(:user) { create(:user, fullname: 'John Doe') }

  before do
    sign_in(admin)

    visit '/'
    click_link 'View Admin Portal'
  end

  it 'can edit the user details' do
    click_link 'John Doe'
    click_link 'Edit'

    fill_in 'Full Name', with: 'Jane Doe'
    click_button 'Update User'

    expect(page).to have_content('User has been updated')
    expect(page).to have_content('Jane Doe')
  end
end

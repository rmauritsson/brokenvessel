require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:fullname) }
  it { is_expected.to validate_presence_of(:contact) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }
end

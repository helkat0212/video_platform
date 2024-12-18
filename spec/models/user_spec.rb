require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:userName) }
  it { should validate_presence_of(:email) }
  it { should have_secure_password }
end

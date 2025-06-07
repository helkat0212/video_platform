require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:userName) }
  it { should validate_presence_of(:email) }
  it { should have_secure_password }
end
RSpec.describe User, type: :model do
  # Validations
  describe 'validations' do
    it { should validate_presence_of(:user_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  # Associations
  describe 'associations' do
    it { should have_many(:videos).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:subscriptions).dependent(:destroy) }
    it { should have_many(:channels).through(:subscriptions) }
    it { should have_many(:channels).with_foreign_key('creatorId').dependent(:destroy) }
    it { should have_many(:payments).dependent(:destroy) }
    it { should have_many(:reports).dependent(:destroy) }
  end

  # Instance Methods
  describe '#subscribed_to?' do
    let(:user) { create(:user) }
    let(:channel) { create(:channel) }

    context 'when user is subscribed to channel' do
      before { user.channels << channel }

      it 'returns true' do
        expect(user.subscribed_to?(channel)).to be true
      end
    end

    context 'when user is not subscribed to channel' do
      it 'returns false' do
        expect(user.subscribed_to?(channel)).to be false
      end
    end
  end

  # Authentication
  describe 'devise authentication' do
    it { should respond_to(:encrypted_password) }
    it { should respond_to(:password) }
  end
end

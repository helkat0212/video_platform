require 'rails_helper'

RSpec.describe Channel, type: :model do
  it { should belong_to(:creator).class_name('User').with_foreign_key('creatorId') }
  it { should validate_presence_of(:channelName) }
  it { should validate_presence_of(:description) }
end


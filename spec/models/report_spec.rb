require 'rails_helper'

RSpec.describe Report, type: :model do
  it { should validate_presence_of(:reportType) }
  it { should validate_presence_of(:content) }
end


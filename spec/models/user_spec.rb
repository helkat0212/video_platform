require 'rails_helper'

RSpec.describe User, type: :model do
  it "validates uniqueness of email" do
    User.create!(email: "test@example.com", password: "password", userName: "TestUser")
    user2 = User.new(email: "test@example.com", password: "password", userName: "AnotherUser")
    expect(user2).not_to be_valid
    expect(user2.errors[:email]).to include("Електронна пошта вже зайнята")
  end

  it "validates uniqueness of userName" do
    User.create!(email: "test1@example.com", password: "password", userName: "TestUser")
    user2 = User.new(email: "test2@example.com", password: "password", userName: "TestUser")
    expect(user2).not_to be_valid
    expect(user2.errors[:userName]).to include("Ім'я користувача вже зайняте")
  end
end

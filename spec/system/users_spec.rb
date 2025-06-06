require 'rails_helper'

RSpec.describe "Users", type: :system do
  it "creates a new user" do
    visit new_user_path
    fill_in 'User Name', with: 'TestUser'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Create User'
    expect(page).to have_content('User was successfully created')
  end
end

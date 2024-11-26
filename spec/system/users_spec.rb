require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it 'creates a new user' do
    visit new_user_path

    fill_in 'User Name', with: 'TestUser'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Role', with: 'admin'

    click_button 'Create User'

    expect(page).to have_content('User was successfully created.')
  end
end

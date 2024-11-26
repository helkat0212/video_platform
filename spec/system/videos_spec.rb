require 'rails_helper'

RSpec.describe "Videos", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it 'creates a new video' do
    user = User.create!(userName: 'TestUser', email: 'test@example.com', password: 'password', role: 'admin')
    login_as(user, scope: :user)

    visit new_video_path

    fill_in 'Title', with: 'Test Video'
    fill_in 'Description', with: 'Test Description'
    fill_in 'Url', with: 'http://example.com/video.mp4'
    fill_in 'UploadDate', with: '2024-11-22'

    click_button 'Create Video'

    expect(page).to have_content('Video was successfully created.')
  end
end

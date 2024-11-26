require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it 'creates a new comment' do
    user = User.create!(userName: 'TestUser', email: 'test@example.com', password: 'password', role: 'admin')
    video = Video.create!(title: 'Test Video', description: 'Test Description', url: 'http://example.com/video.mp4', uploadDate: '2024-11-22', user: user)
    login_as(user, scope: :user)

    visit video_path(video)

    fill_in 'Text', with: 'Great video!'
    fill_in 'DatePosted', with: '2024-11-22'

    click_button 'Create Comment'

    expect(page).to have_content('Great video!')
  end
end

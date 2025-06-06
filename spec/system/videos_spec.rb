require 'rails_helper'

RSpec.describe "Videos", type: :system do
  it "creates a new video" do
    visit new_video_path
    fill_in 'Title', with: 'Test Video'
    fill_in 'User Name', with: 'TestUser'
    fill_in 'Description', with: 'This is a test video.'
    click_on 'Create Video'
    expect(page).to have_content('Video was successfully created')
  end
end

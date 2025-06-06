RSpec.describe "Comments", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
    @user = User.create!(
      email: "test@example.com",
      password: "password",
      userName: "TestUser"
    )
    @video = Video.create!(
      title: "Test Video",
      description: "Test Description",
      url: "https://example.com/video",
      uploadDate: Time.current,
      user: @user
    )
    @comment = @video.comments.build(
      datePosted: Date.today,
      user: @user
    )
    sign_in @user
  end

  it "creates a new comment" do
    visit new_video_comment_path(@video, locale: I18n.default_locale)
    fill_in 'Text', with: 'Great video!'
    # datePosted and video_id are set via hidden fields
    click_button 'Create Comment'
    expect(page).to have_content('Comment was successfully created')
  end
end

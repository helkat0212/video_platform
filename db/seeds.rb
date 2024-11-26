# Users
user1 = User.create!(userName: 'Alice', email: 'alice@example.com', password: 'password', role: 'admin')
user2 = User.create!(userName: 'Bob', email: 'bob@example.com', password: 'password', role: 'user')

# Channels
channel1 = Channel.create!(channelName: 'Tech Channel', creatorId: user1.id, description: 'A channel about tech', createDate: Date.today)

# Videos
video1 = Video.create!(title: 'Ruby on Rails Tutorial', description: 'A tutorial about Rails', url: 'http://example.com/video1', uploadDate: Date.today, user: user1)
video2 = Video.create!(title: 'JavaScript Basics', description: 'Learn JavaScript basics', url: 'http://example.com/video2', uploadDate: Date.today, user: user2)

# Comments
comment1 = Comment.create!(user: user2, video: video1, text: 'Great video!', datePosted: Date.today)

# Subscriptions
subscription1 = Subscription.create!(user: user2, channel: channel1, startDate: Date.today, endDate: Date.today + 30)

# Payments
payment1 = Payment.create!(user: user2, amount: 19.99, date: Date.today, status: 'completed')

# Reports
report1 = Report.create!(reportType: 'Monthly', generatedDate: Date.today, content: 'Monthly report content')

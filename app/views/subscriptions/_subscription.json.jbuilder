json.extract! subscription, :id, :userId, :channelId, :startDate, :endDate, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)

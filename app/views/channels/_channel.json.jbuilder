json.extract! channel, :id, :channelName, :creatorId, :description, :createDate, :created_at, :updated_at
json.url channel_url(channel, format: :json)

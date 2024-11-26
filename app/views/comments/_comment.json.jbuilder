json.extract! comment, :id, :userId, :videoId, :text, :datePosted, :created_at, :updated_at
json.url comment_url(comment, format: :json)

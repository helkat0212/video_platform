json.extract! user, :id, :userName, :email, :password, :role, :created_at, :updated_at
json.url user_url(user, format: :json)

json.extract! user, :id, :screen_name, :name, :password_digest, :description, :comment, :created_at, :updated_at
json.url user_url(user, format: :json)

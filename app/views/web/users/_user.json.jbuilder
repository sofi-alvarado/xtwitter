json.extract! user, :id, :name, :username, :bio, :location, :link, :email, :password, :lastname, :created_at, :updated_at
json.url user_url(user, format: :json)
